unit UnitAngles;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;


procedure UpdateAngles
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblPP: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

procedure UpdateAngles
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblPP: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );
var

   sTrkCode: string;
   sSaveTrkCode: string;

   dtRaceDate: TDateTime;
   dtSaveRaceDate: TDateTime;

   iHorseNbr: integer;
   iSaveHorseNbr: integer;

   iIdx: integer;

   iStaCnt: integer;
   iTotalCnt: integer;

   bRouteRace: boolean;
   bSprintRace: boolean;

   iPPNbr: integer;

   bPPRouteRace: boolean;
   bPPSprintRace: boolean;

   fPPPos: double;
   fPPDistanceInFurlongs: double;

   iLen: integer;
   sTmp: string;
   iBegPos: integer;

   b1stPPSprint: boolean;
   b1stPPRoute: boolean;

   b2ndPPSprint: boolean;
   b2ndPPRoute: boolean;

   b3rdPPSprint: boolean;
   b3rdPPRoute: boolean;

   b3rdAfterLayoff: boolean;

   bSprToRteToSpr: boolean;
   bRteToSprToRte: boolean;

   iLowestWeight: integer;
   iLowestClass: integer;

   iNbrOfRacesSinceLayoff: integer;
   iDaysFromTodaysRace: integer;

   b1stClaiming: boolean;
   b1stMCL: boolean;

   bBestEffortLastRace: boolean;

   iNbrOfCLM: integer;
   iNbrOfMCL: integer;

   iNbrOfRaces: integer;


   procedure CheckAngles();
   begin

      b1stClaiming := False;
      b1stMCL := False;

      b1stPPSprint := False;
      b1stPPRoute := False;

      b2ndPPSprint := False;
      b2ndPPRoute := False;

      b3rdPPSprint := False;
      b3rdPPRoute := False;

      b3rdAfterLayoff := False;

      bSprToRteToSpr := False;
      bRteToSprToRte := False;

      iLowestWeight := 999;
      iLowestClass := 999;

      iNbrOfCLM := 0;
      iNbrOfMCL := 0;

      iNbrOfRaces := 0;

      iPPNbr := 0;
      //Everyone starts with 1 point
      while (iPPNbr < MAX_ANGLE_PP) do begin
         tblPP.IndexName := '';
         tblPP.SetKey();
         tblPP.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblPP.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
         tblPP.FieldByName('HorseNbr').AsInteger := tblE.FieldByName('HorseNbr').AsInteger;
         tblPP.FieldByName('PPNbr').AsInteger := iPPNbr;
         if (tblPP.GotoKey()) then begin
            Inc(INbrOfRaces);
            fPPDistanceInFurlongs := GetPastFurlongs(tblPP.FieldByName('DistanceDesc').AsString);
            iDaysFromTodaysRace := dm.tblPP.FieldByName('DaysFromTodaysRace').AsInteger;

            if (fPPDistanceInFurlongs < MILE_FURLONGS) then begin
               bPPRouteRace := False;
               bPPSprintRace := True;
            end else begin
               bPPRouteRace := True;
               bPPSprintRace := False;
            end;

            if (tblPP.FieldByName('RaceType').AsString = 'MCL') then begin
               Inc(iNbrOfMCL);
            end;

            if (tblPP.FieldByName('RaceType').AsString = 'CLM') then begin
               Inc(iNbrOfCLM);
            end;

            if atoi(tblPP.FieldByName('Weight').AsString) < iLowestWeight then begin
               iLowestWeight := atoi(tblPP.FieldByName('Weight').AsString);
            end;

            if (tblPP.FieldByName('Class').AsInteger < iLowestClass) then begin
               iLowestClass := tblPP.FieldByName('Class').AsInteger;
            end;

            if (iPPNbr = 1) then begin
               if (fPPDistanceInFurlongs < MILE_FURLONGS) then begin
                  b1stPPSprint := True;
                  b1stPPRoute := False;
               end else begin
                  b1stPPSprint := False;
                  b1stPPRoute := True;
               end;
            end;

            if (iPPNbr = 2) then begin
               if (fPPDistanceInFurlongs < MILE_FURLONGS) then begin
                  b2ndPPSprint := True;
                  b2ndPPRoute := False;
               end else begin
                  b2ndPPSprint := False;
                  b2ndPPRoute := True;
               end;
            end;

         end; //If goto key
         Inc(iPPNbr);
      end; // While

   end;


begin

   hLog.AddToLog('UpdateAngles', msevOperation);
   try
      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblPP);

      try
         iHorseNbr := 0;
         iSaveHorseNbr := 0;

         sTrkCode := '';
         sSaveTrkCode := '';

         dtRaceDate := 0;
         dtSaveRaceDate := 0;

         iStaCnt := 0;
         iTotalCnt := 0;


         tblE.First();
         InitPrgBar(tblE.RecordCount);

         staBar.SimpleText := 'Updating Angles - ' +
            tblE.FieldByName('TrkCode').AsString + ' ' +
            tblE.FieldByName('RaceDate').AsString + ' Race # ' +
            tblE.FieldByName('RaceNbr').AsString + ' ' +
            IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Angles - ' +
                  tblE.FieldByName('TrkCode').AsString + ' ' +
                  tblE.FieldByName('RaceDate').AsString + ' Race # ' +
                  tblE.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
               Application.ProcessMessages();
               iStaCnt := 0;
            end else begin
               Application.ProcessMessages();
               Inc(iStaCnt);
               Inc(iTotalCnt);
            end;

            IncPrgBar();

            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin
               if tblR.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
                  bRouteRace := False;
                  bSprintRace := True;
               end else begin
                  bRouteRace := True;
                  bSprintRace := False;
               end;

               bBestEffortLastRace := False;

               CheckAngles();

               //Best Effort Angle
               //This is a simple angle to understand.
               //Whenever a horse in his LR has earned his best SR in his current chart when either winning the race or clearly trying to win it, he should be debited with this angle.
               //This doesn’t always mean, however, that such an angle horse should always be automatically eliminated.
               //We might find good reason to retain him – and actually even bet him!
               //But nonetheless, just to keep my angles “ledger” straight,
               //I always debited a horse with the angle whenever he qualified on the raw SR data.
               //Generally speaking, any horse who won or finished within 3.5 lengths of the winner
               //and earned its best SR in that race should be debited with this angle.


               b3rdAfterLayoff := False;
               if ((iPPNbr - 1) > 3) then begin
                  if (iNbrOfRacesSinceLayoff = 2) then begin
                     b3rdAfterLayoff := True;
                  end;
               end;

               if ((bSprintRace) and (b1stPPRoute) and (b2ndPPSprint)) then begin
                  bSprToRteToSpr := False;
               end;

               if ((bRouteRace) and (b1stPPSprint) and (b2ndPPRoute)) then begin
                  bRteToSprToRte := False;
               end;


               b1stMCL := False;
               b1stClaiming := False;
               if iNbrOfRaces > 1 then begin
                  if (tblE.FieldByName('RaceType').AsString = 'MCL') then begin
                     if ((iNbrOfCLM = 0) and (iNbrOfMCL = 0)) then begin
                        b1stMCL := True;
                     end;
                  end;
                  if (tblE.FieldByName('RaceType').AsString = 'CLM') then begin
                     if ((iNbrOfCLM = 0) and (iNbrOfMCL = 0)) then begin
                        b1stClaiming := True;
                     end;
                  end;
               end;

               tblE.Edit();
               tblE.FieldByName('LowestWeight').AsInteger := iLowestWeight;
               tblE.FieldByName('LowestClass').AsInteger := iLowestClass;

               tblE.FieldByName('Is1stClaiming').AsBoolean := b1stClaiming;
               tblE.FieldByName('Is1stMCL').AsBoolean := b1stMCL;

               // tblE.FieldByName('IsBestEffortLastRace').AsBoolean := bBestEffortLastRace;
               // tblE.FieldByName('IsRteToSprToRte').AsBoolean := bIsRteToSprToRte;
               // tblE.FieldByName('IsSprToRteToSpr').AsBoolean := bIsSprToRteToSpr;
               // tblE.FieldByName('Is3rdAferLayoff').AsBoolean := bIs3rdAferLayoff;

               //Drop in Class Last Start (DCLS)
               // How do we know that a horse is well meant who has the
               // Drop in Class Last Start (DCLS) angle in its chart? The answer is very simple:
               // If the horse improved its speed rating (SR) in it last race off its 2RB,
               // then you can be reasonably confident that the horse is well meant.
               // In this pony's case, he ran to a 48 in his LR -- a one point improvement
               // over his his 2RB. Now, this wasn't very much of an improvement, if any at all.

               //Believe in K.I.S.S......An E (E8, E7 preferred) type runner
               // Going off at 8-1 odds or higher
               // Who has more than 2 career wins,
               // Has raced within the last 21 days and
               // Trainer win % is at least 15%.
               // You'd be suprised how many of these types go each week.

               //Fresh Horse (FH).
               // To qualify, a horse must have been laid off for a minimum of 30 days
               // between his 2RB and LR; however, the layoff should not exceed more
               // than 60 days. The reason for this is because anything more than 60 days
               // could indicate that the horse has been recuperating from some ailment or
               // physical problem.
               // I have “shaded” this angle (-FH) whenever the rest period is less than
               // 30 days but more than 24 days between the LR and 2RB.
               // I have also shaded this angle (-FH) whenever the rest period of
               // 30 to 60 days or so is between the 2RB and 3RB.

               //In her 2RB, she earned her highest SR in a moderately fast pace.
               //Then she came back to earn her second best rating in her LR –
               //but in a faster pace. The 2-point differential between the two races
               //would have qualified her on the Nearly Best Effort (NBE) angle.
               //To qualify on this negative angle (generally speaking) a horse in his LR
               //must have run to within three points of his best SR in his current chart.

               //This particular method I call the LW or Lowest Weight method.
               //This method actually involves a few trainer maneuvers. And herein
               //lies its strength because as the name of the method implies, the
               //trainer who is going all out today with his charge will have
               //excerised all his "weight off" options, of which there are three.
               //He does this to get his charge in with a very low impost.
               //To qualify on this play, the trainer must have done the following:
               //1.) Dropped his horse in class or price last start.
               //2.) Horse's entered price today must be below the top price
               //    stipulated in the race conditions.
               //3.) Horse must have a bug boy aboard.
               //4.) Horse's impost today must be the lowest in his current chart.
               //5.) Horse must have at least three races in his current chart.

               //Unlike the previous example, however, this pony didn't look nearly as sharp
               //as Irish Reality did -- especially off his last two races where he had a
               //combined beaten lengths of 51 lengths! So, right here is a good place to
               //give everyone a little tipoff about these kinds of horses whose current form
               //doesn't appear to be very good. While there are exceptions to this little Form rule
               //I'm about to share, the following will serve you well over the long haul.
               //The big question here is this: How do we know that a horse is well meant who has the
               //Drop in Class Last Start (DCLS) angle in its chart? The answer is very simple:
               //If the horse improved its speed rating (SR) in it last race off its 2RB,
               //then you can be reasonably confident that the horse is well meant.
               //In this pony's case, he ran to a 48 in his LR -- a one point improvement
               //over his his 2RB. Now, this wasn't very much of an improvement, if any at all.
               //But Chenio had some other really good angles going for him, also --
               //over and above the one under discussion.

               //What follows is a brief explanation of why the 3 horse in the 10th at TAM
               //on 1/10 was such a threat on the basis of her current form.
               //Formally Jay had a principle I called the “ultimate form indicator” (UFI)
               //in her chart. To qualify on this principle,
               //a horse had to have a Form angle coupled with a LR.SR that was equal to or
               //better than his previous race’s SR.

               //In FJ’s case, she had what I called the Form-Consistency
               //(or F angle for short) in her chart. In order to qualify on his angle,
               //a horse had to have finished in the money in at least three out of its last
               //four races – with the race that forms the basis to the angle being of relatively
               //recent date. FJ had an IMF in her last thee races, thereby qualifying perfectly.
               //(The race that formed the basis to her F angle was the 3RB which she ran back on 21Sep05.)

               //The Hidden Condition (HC) Angle
               // Here are the parameters for this excellent price-getting angle –
               // my personal favorite LR performance angle. And in STI’s case,
               // he had the “classic” version – the strong version
               // Please take careful note of his LR running line.
               // He was closer up in BL and RP at the 1C than he was at the 2C.
               // After falling back at this 2C, he gained lengths and RPs to the SC,
               // then faded back to the FC. This is the “classic” test race pattern
               // wherein a horse actually made two moves. A move to get to where
               // he was at the 1C, and then another move to get where he was by the SC.
               // To qualify on this strong version, the horse must have run in the
               // manner as described above and gained a minimum of one (1) RP and
               // one (1) length from the 2C to the SC. That’s it.
               // And I couldn’t even begin to tell you how often a “tested” horse
               // won after meeting these minimum requirements!
               // In the case of STI, he exceeded the minimum.
               // He gained only one RP, but gained three lengths between the 2C and SC.

               //The Verified Claim (VC) Angle
               // The next thing we see with this horse is that he was claimed in his 2RB.
               // Now, in most cases a trainer will bump his horse up in class in order to protect
               // his new acquisition. But in the vast majority of cases, the bump-up will not
               // be nearly as stiff as it was in this horse’s LR. He was bumped up to a level
               // that was over 100% greater than for what he was claimed! This qualifies the
               // horse on the first part of this angle; for a trainer must bump up his horse
               // for at least 100% over his purchase price. Whenever a trainer bumps up his
               // newly acquired horse this sharply, this tell us that he thinks he claimed a bargain.
               // The trainer probably thinks he got quite a deal! This kind of steep raise
               // tells us that the trainer probably has high regard for the animal.

               //To qualify on the second part of the angle, the horse must not have a win
               //in his current chart that was at or above the claiming level for which
               //he was claimed. Now…someone may argue that STI didn’t qualify because
               //he won a MC25000 at HOL back on 17Jan05. And many people rightfully believe
               //that those maiden claimers are run at inflated prices, and that
               //their “true worth”, in terms of straight claimers, is around half.
               //Fine. I don’t have a problem with that.
               //However, in STI’s case, he has demonstrated his inability to win at the
               //$12,500 level, at the $10,000 level and even at the paltry $5,000 level at
               //a class “B” track at best! For these reasons, I would have “shaded” this angle.
               //In short, this horse’s only claim to “fame” was that MC win back in ’05 and
               //a win at the $5,000 level at FPX in his 3RB! This horse hasn’t even come close
               //to winning at the level at which he was entered in his LR! Not even close.
               //And I submit to everyone here that this was the major reason the crowd sent
               //him off at 42-1!


               // The Special "A" Method
               //For lack of a better label, I've called the performance side of this angle the "A" angle. And because the trainer maneuver side of this combination angle is unusual, I've tagged it "special". Let's look are the simple, easy-to-spot rules first, and then expand on them later.
               //1.) The horse must have a 2RB.IMF w/i the last 60 days or so.
               //2.) The horse must have a LR.OMF, preferably w/i the last 30 days.
               //3.) The horse's LR must have been an easy conditioning race.
               //4.) The horse's form cycle or LR.SR (speed rating) must indicate current sharpness.
               //5.) The horse must have been bumped up in Class or Price last start and must not be dropping in Class or Price today.

               //FO or “Fifty Off” angle, we’ll never go beyond a horse’s 3RB in his pp chart.
               //The following are the parameters for this angle, and what will follow will be a
               //few examples taken from actual races, which, hopefully, should make
               //everything clear to all.
               //The Rules
               //1) Ideally, the horse will have an OMF in all three of its most recent races.
               //   However, an IMF in the race in which it was “bet down sharply” is acceptable,
               //   providing the odds are decent on the animal today,
               //   but in no case should the horse won any of its last three..
               //2) The horse must have been bet down sharply in either its 2RB or LR.
               //3) In the race in which the horse was bet down, he must not have been dropping
               //   in class off its previous race.
               //4) In the race in which the horse was bet down, the odds must be at minimum 50% lower
               //   than the odds of its previous race.
               //   Again, the rules are simple and straightforward and easy to spot. Now, on to some examples.

               //This last angle we’ll take up is a spin-off on the one I just shared with everyone.
               //ssentially, the only difference between the two is that the horse’s odds today are at least 50% lower
               //than the horse’s highest odds within its last three races. Therefore, I call this the Fifty Off Today (FOT) angle.
               //The reason why I use any of the last three is because sometimes a horse will be dropped in class in its 2RB or LR,
               //and we’ll usually find a corresponding drop in price (often quite sharp) on such occasions.
               //Also, as we have already seen, a horse can qualify on both odds angles!
               //This was the case with all three of the examples we looked at in my last post!

               //I can’t stress this enough: The DCLS or its stronger version the
               // BW-1 (type 1, since there two versions to the Before Winning angle)
               // is can become a pretty powerful, price-getting maneuver whenever:
               //a) the horse is dropping weight today off its LR
               //b) the horse is entered today at the same or higher class/price level
               //c) the horse improved its LR SR over its 2RB SR
               //d) the horse in its LR showed early speed (ES) to at least the 2C, or better yet to SC
               //e) or the horse gained ground in the stretch run its LR

               //The price/class levels are important to understand.
               //This animal qualified on the Up in Class-Price Down Angle (UCPD).
               //In his July 18th race, he was bumped up in class off his race of 13Jun97,
               //and his tote odds were down today! This combination constitutes the unusual,
               //the unexpected, the so-unlike-the public’s betting routine. In fact,
               //KTAK was moving up today on two levels: price/class and moving up in the
               //conditions, e.g. running today in a N3Y off of his previous N2Y race.
               //Recall what I wrote earlier in this thread: Trainers can make very subtle
               //price class shifts; therefore, one must learn to develop eagle-eyed skills
               //in spotting these subtle moves.

               //Before jumping in to the next race, it might be a good idea to succinctly
               //review the parameters for horses with an “ultimate form indicator” (UFI) in
               //its chart.
               //• LR must have been an easy race
               //• LR.SR >= 2RB or 3RB.SR, depending on which race forms the basis to the
               //performance angle.
               //• Horse must have a performance angle in its chart.
               //Previously we looked briefly at the A angle, which is a 2RB performance
               //angle when we studied the Special A method of play. The parameters for this
               //angle are:
               //• LR was an easy race.
               //• LR.OMF
               //• 2RB.IMF
               //• 2RB.DATE <= 60 days from Today’s Race Date (generally speaking)

               //For example, a B angle horse (for lack of a better designation) is one who
               //displayed ES
               //in his 2RB, finishing out of the money in that race and in his LR.
               //These horses can pay off
               //megabucks, as can a horse who ran to 2.5 lengths of the winner in the SC
               //in his 3RB
               //(BB3 angle which we looked at on another occasion) and ran out in both subsequent races,
               //or a horse who has a 3RB.IMF (BA angle). In fact, when a BA angle horse has the Double Drop
               //(DD) angle in his chart (i.e. dropped last start and dropping again today),
               //his BA angle becomes a “power” angle because the combination of the two angles is so strong.
               //Also, as stated previously, whenever a horse has the BW-2 angle in his chart
               //(Before Winning, type 2), this greatly strengthens the DC (Dropping in Class) or DD angle.
               //Once again, here are the parameters, formally, for the BW-2 trainer maneuver angle:
               //LR.FP > 1
               //LR.ECP* > Todays.ECP
               //[2RB, 3RB].ECP > Today’s ECP
               //(*Entered Class or Price)

               //Now, here’s another angle to add to your arsenal, if so inclined – the ES or Early Speed Angle, which is a LR performance angle. Here are the parameters:
               //LR.[1C, 2C, 3C].BL < 3.75
               //LR.FC.BL > 4
               //What this means is that for the first three calls of the race the horse must have run no more than 3.5 lengths off the leader at each of these calls, then faded back in the stretch run to, preferably finish at least 4 lengths behind the winner. This angle is very frequently found with the A angle, which is a 2RB performance angle.
               //With this all behind us, we can now look at the most subtle performance and form cycle angle in my arsenal. You won’t come across these angles too often, but when you do, look out because often the winners pay off in “telephone” numbers. These angles tend to pay very well because they are find their roots in the 4RB, and the public simply doesn’t have much of a clue on how to properly evaluate these kinds of angles.
               //The performance angle is the BBA or Beaten BA angle. And the form cycle angle that combines with so well with it is the BUFI angle. I’m attaching a portion of the chart to the 1 horse in the 5th at GP on 12Jan06 – Flight To Justice.
               //Why this horse is a BUFI type is because the SR in the race that completed his BA angle (i.e. the 2RB) was higher than the SR in the race that formed the basis to this angle (i.e. the 4RB). Therefore, at that point in time Flight To Justice was a UFI horse. But after his LR, he became a BUFI horse because he failed to win, his LR was not an overtaxing effort, and his LR.SR was lower than what he earned in his previous race.
               //In addition to all this, he was an A angle horse, due to his 2RB.IMF and LR.OMF. And even more than this, he had the ES angle in his LR. Please note his beaten lengths off the leader for the first 3 calls of his LR. So much for his performance angles and form cycle.
               //In terms of his trainer maneuver angles, he had the BW-2, since the class level of his 2RB and 3RB were higher than the price stipulated in today’s condition. Therefore, he had the strong version of the DC angle.
               //He also had a pinpoint angle in his chart, which I call the Lowest Class (LC) angle. (This angle is a second cousin” to the LW angle.) To qualify on this angle, the top price in today’s race condition must be the lowest in his current chart. As you can see from my attachment, the top price in today’s claimer was 14K – which represents the lowest level that he has run at in his current chart.
               //The only knock this horse had against him was that he has been away for about 50 days – but everything else in his chart said that he was sharp, was in an excellent form cycle mode, and that the trainer meant business with him today to the presence of the BW-2 and LC angles. At his prevailing odds, he was certainly worthy of a bet.

               //Hopefully, I’ll be able to demonstrate with the following race example how racing angles can “animate” a horse’s chart – make it dynamic by telling a story.
               //In post #115 written on 1/16, I wrote the following:
               //Everyone also knows by now that I’m partial to horses who are not dropping in class today, yet have a class/price maneuver in their charts. However, no one should infer from this that class drop-downs today are always price killers. What will generally determine a drop-down’s price is the subtlety of the performance angles in his chart. For example, a B angle horse (for lack of a better designation) is one who displayed ES in his 2RB, finishing out of the money in that race and in his LR. These horses can pay off in megabucks…
               //At the end of this post, you will find the chart of the 1 Horse Una Mirim who was entered today in the 1st at GP. This race was conditioned for F&M 4&Up going 6f over the m.t. and who were entered at the top tag of 18K or the bottom tag of 16k. Seven were entered but only five started.
               //Performance/Combo Angles:
               //The first thing we’ll notice is that this mare is a B angle horse. She displayed ES to the SC in her 2RB, and had a LR.OMF in an easy race. Qualified perfectly.
               //The second noteworthy item is that has a LR performance angle, i.e. the Special Stretch Gain (SSG) angle, which I’m not going to discuss now, except to say that the horse must have gained at last one length in the stretch run and finished 4th. Qualified perfectly.
               //(The gain in the LR and the fading back in the 2RB forms what many of you seem to call the “Z” pattern, incidentally.)
               //Next, this mare was in the UFI form cycle mode, earning a substantially higher LR.SR compared to her 2RB.SR. This form cycle, coupled with both her performance angles, indicates that this mare could be set to “explode” today.
               //So much for the “whats” in this mare’s chart. Now, let’s examine the “whys” to see if we can find any answers to the second most important question we should bring to bear upon every horse’s pp chart, which is:
               //Why has the trainer chosen to enter his horse under today’s race conditions?
               //Trainer Maneuver and Pinpoint Angles:
               //In this regard, the first thing we notice is that this mare should be credited with the BW-2 angle because the class levels in her 2RB and 3RB are higher than the class level of today’s race. Why is this? Because an Optional Claiming race should be considered to be a slightly higher class level than a straight claimer – most especially when in those OCs, the horse was not entered to be claimed! Generally speaking, a non-claiming event (including when horses are entered to not be claimed in OC races) is “better” than a claiming one. In fact, with this mare, she has only one race in her current chart that was in a straight claimer prior to today’s – her 10RB!
               //Another reason why, under the above conditions, OCs are “better” races is because when a horse is dropped today in a straight claimer, this often indicates that the trainer means business since he could lose the animal through the claiming box. If he’s going to risk losing the animal, then chances are good that he’s going to go for the gold by garnering the lions’ share of the purse, and possibly collecting on a nice bet or two.
               //The next thing we notice about this trainer is that he bumped his horse up in class last start off a “poor” race. He bumped her up from an OC16K event to a OC25K event. This maneuver is called the BX angle – for lack of a better designation. The “B” is because this trainer maneuver is often found with B angle horses, and when this is the case it strengthens this performance angle. The “X” part is because a horse’s last two outings must look “poor” – certainly must have been OMFs.
               //Whenever we see this maneuver, we should ask ourselves: Why is the trainer bumping his horse up in class off of a poor race and dropping her today?. More often than not, by the way, this maneuver will also be found with the BW-2 or the generally weaker DC (Drop in Class) angle. And when the horse has good things going for it, in terms of current form, then there can only be one reasonable answer to this question. So, things are looking pretty decent for this mare in the TI dept., also – but we’re not done yet – not by a long shot (bad pun intended).
               //The trainer further tipped his hand today with the Distance Factor. However, I’m not going to go into depth on the two distance-related angles that UM had her in chart because I wish to spend some time on more fundamentally important items before delving too deeply into too many Pinpoint Angles. These angles are for more advanced play. Suffice it say for now, though, that this animal had the Cutting Back (CB) and Stretching Out (SO) angles in her chart, and when these two are found in combination with one another, they can be very powerful! (Tom has already attested to this fact.)
               //Please note very carefully the distances of her last two races. In her 2RB she ran in a 6.5f heat and lost ground in the stretch run. In her LR, she ran in a 5f dash, and gained ground in the stretch run. Now look a the distance of today’s race: 6f! A distance that is right in between her last two outings! Her TI factor is getting stronger by the minute. Why? Because it’s the trainer who chooses where and how he’s gong to place his charge. But we’re not done yet.
               //This mare has one of a few claimed horse angles that I have in my arsenal. The one she had was the Claimed Horse, type 3 angle (CH-3). Somehow at some point since this mare was claimed from trainer Chavez, she ended up back in his possession again. Perhaps my TSN pp charts aren’t showing the claim (maybe someone could check) or she was bought back privately. In either case, the fact that a previous trainer now owns her again indicates that he probably holds this animal in high regard – even though her ’05 record isn’t very impressive. Maybe this trainer knew what made this mare tick – had her number – had her “ace card”. At any rate, this is another positive pinpoint angle.
               //Then she had another pinpoint angle – the LC, which we also looked at briefly on 1/16. In that same message, already cited earlier, I wrote:
               //He also had a pinpoint angle in his chart, which I call the Lowest Class (LC) angle. (This angle is a second cousin” to the LW angle.) To qualify on this angle, the top price in today’s race condition must be the lowest in his current chart. As you can see from my attachment, the top price in today’s claimer was 14K – which represents the lowest level that he has run at in his current chart.
               //Since we have seen that today’s class is the lowest in UM’s current chart, I would have done better if I had written earlier “price/class” instead of just price.
               //To summarize, then, here is what UM had going for her in the “whats” and “whys” departments in terms of her racing angles: B, SSG, UFI, BW2, BX, CB, SO, LC. Do not these seven racing angles combine to form a powerful picture of what has been going on recently with this horse leading up to today’s race? And don’t all her angles combine to tip us off as to why her trainer has entered her in this spot today? Does she not have a powerful VP principle going for her? And I might add that all this was especially true because she had at least three (3) pinpoint angles in her chart. These can be very powerful indicators.
               //Wasn’t her $45.80 win mutuel an unbelievable gift from a crowd that is essentially ignorant of racing angles?
               //We’ll come back to a couple of other horses in this race later.

               //Performance Angles: Front Running (FR) angle, which means the horse has the
               //ability to get out and set the pace by at least the 2C of a race.
               //And this race can be any in the horse’s current chart.
               //This is a very desirable angle to have and we’ll look at this one more closely
               //down the road.
               //She was an A angle horse who came back in her LR to earn an 18-point lower SR.
               //Not a good sign! The drop of so many points could be an indication that that
               //2RB took too much out of her.
               //For your info, she was in a Progressive Regressive, type 2 (PR2) form cycle mode
               //– one fairly common to A angle types. Note her SRs from the 4RB to the 2RB –
               //all ascending, then she came back with a lower SR –
               //but one that would have been too low for my liking.
               //And to her credit she had the BW2 trainer maneuver angle.
               //The fact that she was “dropping” into a SC today would have
               //suggested that the trainer, perhaps, was going to try to squeeze
               //a win out of her.
               //She also had another negative angle in her chart, insofar as I
               //would have been concerned. She was claimed last start,
               //which under most circumstances, I considered to be a negative angle.
               //Why? Because a horse in new hands, in a new barn,
               //with a new training regime, with new feed, new handlers, etc., etc.
               //might need some time to adjust to his new surroundings.
               //So, I would have debited this filly with the Claimed Last Start (CLS) angle.


               tblE.Post();

            end;
            tblE.Next();
         end;

      except
         tblE.IndexName := '';
         CloseTable(tblR);
         CloseTable(tblE);
         CloseTable(tblPP);
         ClearPrgStatusBars();
      end;

      tblE.IndexName := '';
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblPP);
      ClearPrgStatusBars();


   finally
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();

   end;

end;

end.
//boxcar5
//
//
//1C- first call
//2C- 2nd call
//Sc- stretch call
//Fc -finish
//omf -out of money finish
//imf -in the money finish
//lr- last race
//2rb- 2nd race back
//fp -finish positon
//es- early speed
//lr -last race
//lc -lowest claiming price
//sr-- speed rating
//fh -fresh horse
//hc- hidden condition
//vc- verified claim
//
//
//LW or Lowest Weight method
//1.) Dropped his horse in class or price last start.
//
//2.) Horse's entered price today must be below the top price stipulated
// in the race conditions.
//
//3.) Horse must have a bug boy aboard.
//
//4.) Horse's impost(weight) today must be the lowest in his current chart.
//
//5.) Horse must have at least three races in his current chart.
//
//
// play must be restricted to claiming races or optional claiming.
//
//
//
//
//I've called the performance side of this angle the
// "A" angle. And because the trainer maneuver side of this combination angle is
//unusual, I've tagged it "special". Let's look are the simple, easy-to-spot rules
// first, and then expand on them later.
//
//1.) The horse must have a 2RB.IMF w/i the last 60 days or so.
//
//2.) The horse must have a LR.OMF, preferably w/i the last 30 days.
//
//3.) The horse's LR must have been an easy conditioning race.
//
//4.) The horse's form cycle or LR.SR (speed rating) must indicate current sharpness.
//
//5. The horse must have been bumped up in Class or Price last start and must not
//be dropping in Class or Price today.
//
//The horse must have a LR.OMF, preferably w/i the last 30 days.
//
//
//
//the FO or “Fifty Off” angle,
// we’ll never go beyond a horse’s 3RB in his pp chart. The following are the
//parameters for this angle, and what will follow will be a few examples taken
//from actual races, which, hopefully, should make everything clear to all.
//
//The Rules
//
//1) Ideally, the horse will have an OMF in all three of its most recent races.
// However, an IMF in the race in which it was “bet down sharply” is acceptable,
// providing the odds are decent on the animal today, but in no case should the
//horse won any of its last three..
//
//2) The horse must have been bet down sharply in either its 2RB or LR.
//
//3) In the race in which the horse was bet down, he must not have been
//dropping in class off its previous race.
//
//4) In the race in which the horse was bet down, the odds must be at minimum 50%
//lower than the odds of its previous race.
//
//
//Fifty Off Today (FOT) angle
//The 1st at AQU on Dec 10, 97 was a MC conditioned for 2 y.o. fillies running for
//a tag of $25,000., and going 6f on the main track.
//
//Arctic Gold was trained by Luis Barrera and ridden that day by F. Leon.
//His ML was 20-1. Ten started. And AG’s PTO were 33-1.
//
//03Dec97…….2Aqu…..fst 1.70…….Md25000………4-12-1/2……63.00
//19Nov97…….2Aqu….fst 1………...Md35000..7-18-1/2…114.50
//06Nov97…….1Aqu….6f…………...Md35000..8-19-3/4…..98.25
//
//
//The DCLS or its stronger version the BW-1
// (type 1, since there two versions to the Before Winning angle) is can
//become a pretty powerful, price-getting maneuver whenever:
//
//a) the horse is dropping weight today off its LR
//b) the horse is entered today at the same or higher class/price level
//c) the horse improved its LR SR over its 2RB SR
//d) the horse in its LR showed early speed (ES) to at least the 2C, or better yet to SC
//e) or the horse gained ground in the stretch run its LR
//
//And, of course, whenever such angle horses also meet some of your own personal
// handicapping criteria, then so much the better.
//
//The price/class levels are important to understand. This animal qualified on the
// Up in Class-Price Down Angle (UCPD). In his July 18th race, he was bumped up in
// class off his race of 13Jun97, and his tote odds were down today! This combination
//constitutes the unusual, the unexpected, the so-unlike-the public’s betting routine.
//In fact, KTAK was moving up today on two levels: price/class and moving up in the
//conditions, e.g. running today in a N3Y off of his previous N2Y race. Recall what
// I wrote earlier in this thread: Trainers can make very subtle price class shifts;
//therefore, one must learn to develop eagle-eyed skills in spotting these subtle moves.
//
//And, naturally, KTAK qualified on the FOT angle – with 11-1 being well below his
// previous odds of 47-1. Since the “norm” in this game is for horses to drop in price
// today when dropping in class, then inquisitive minds must ask: Why the precipitous
//drop today – off two consecutive races in which the horse kept moving up in class?
//And off his LR effort when he was well beaten? It doesn’t make any sense – except
//to angle player like myself.
//
//“ultimate form indicator” (UFI) in its chart.
//
//• LR must have been an easy race
//• LR.SR >= 2RB or 3RB.SR, depending on which race forms the basis to the performance angle.
//• Horse must have a performance angle in its chart.
//
//Previously we looked briefly at the A angle, which is a 2RB performance angle
//when we studied the Special A method of play. The parameters for this angle are:
//
//• LR was an easy race.
//• LR.OMF
//• 2RB.IMF
//• 2RB.DATE <= 60 days from Today’s Race Date (generally speaking)
//
//Naturally, not all A angle horses make good. When these angle horses
// fail to win, they become Beaten A (BA) angle types. In this scenario,
//the race that forms the basis to this angle is the 3RB, and the parameters
// would look like this:
//
//• LR.FP* > 1
//• 2RB.OMF
//• 3RB.IMF
//• 3RB.DATE <= 75 days (generally speaking)
//
//(*Finish Position)
//
//Likewise, not all UFI form cycle horses win. When they lose,
// they become a Beaten UFI type (BUFI). Like the BA angle above,
//the race that forms the basis to this form cycle angle is also the 3RB,
// and the parameters would look like this:
//
//• LR.FP > 1
//• LR was relatively easy race (in most circumstances save for one)
//• 2RB.OMF
//• 3RB has a PA**
//• 3RB.DATE <= 75 days (generally speaking)
//
//(**Performance Angle)
//
//whenever a horse has the BW-2 angle in his chart
//(Before Winning, type 2), this greatly strengthens the DC (Dropping in Class)
// or DD angle. Once again, here are the parameters, formally, for the BW-2 trainer
// maneuver angle:
//
//LR.FP > 1
//LR.ECP* > Todays.ECP
//[2RB, 3RB].ECP > Today’s ECP
//
//(*Entered Class or Price)
//
//Now, here’s another angle to add to your arsenal, if so inclined – the ES or
// Early Speed Angle, which is a LR performance angle. Here are the parameters:
//
//LR.[1C, 2C, 3C].BL < 3.75
//LR.FC.BL > 4
//
//What this means is that for the first three calls of the race the horse must
// have run no more than 3.5 lengths off the leader at each of these calls,
//then faded back in the stretch run to, preferably finish at least 4 lengths
// behind the winner. This angle is very frequently found with the A angle,
//which is a 2RB performance angle.
//
//
//• Speed Ratings (SRs) of recent races, including SR patterns which determine if a
//horse in a positive, negative or even “flat line” (neutral) form cycle mode.
//SRs also help determine how close a horse has recently run to his best effort in
//his current chart.
//
//• Pace Ratings – both Early (EP) and Late ( LP). (By “early”, I mean only the rating
// at the 2C of races.).
//
//• Duration of Pressure. By this I mean the distance within a race in which a horse
//either set or pressed the pace. This is an extremely important element that is very
// closely tied in to the two previous ones.
//
//• Dates between recent races. This is important sub-factor because horses need time
// to recuperate from strong efforts – time in which to “recharge their batteries”.
// A “fresh horse” can be mighty dangerous under some circumstances.
//
//• Workouts. Workout angles, as they relate to recent races, can frequently reveal
// not only the state of a horse’s current condition, but a trainer’s intentions, as well.
//
//• Performance Angles. These are very important tools because these angles reveal
//the manner in which a horse has run his recent races. This sub-factor, of course,
//is very closely related to number three above.
//
//Performance/Combo Angles:
//
//The first thing we’ll notice is that this mare is a B angle horse. She displayed ES
//to the SC in her 2RB, and had a LR.OMF in an easy race. Qualified perfectly.
//
//The second noteworthy item is that has a LR performance angle, i.e. the
// Special Stretch Gain (SSG) angle, which I’m not going to discuss now, except to say
//that the horse must have gained at last one length in the stretch run and finished 4th.
// Qualified perfectly.
//
//(The gain in the LR and the fading back in the 2RB forms what many of you seem to
//call the “Z” pattern, incidentally.)
//
//Next, this mare was in the UFI form cycle mode, earning a substantially higher
// LR.SR compared to her 2RB.SR. This form cycle, coupled with both her performance
//angles, indicates that this mare could be set to “explode” today
//
//Performance Angles: Front Running (FR) angle, which means the horse has the ability to
//get out and set the pace by at least the 2C of a race. And this race can be any in the
// horse’s current chart. This is a very desirable angle to have
//
//• Speed Ratings (SRs) of recent races, including SR patterns which determine if a
//horse in a positive, negative or even “flat line” (neutral) form cycle mode.
//SRs also help determine how close a horse has recently run to his best effort in
//his current chart.
//
//• Pace Ratings – both Early (EP) and Late ( LP). (By “early”, I mean only the rating
// at the 2C of races.).
//
//• Duration of Pressure. By this I mean the distance within a race in which a horse
//either set or pressed the pace. This is an extremely important element that is very
// closely tied in to the two previous ones.
//
//• Dates between recent races. This is important sub-factor because horses need time
// to recuperate from strong efforts – time in which to “recharge their batteries”.
// A “fresh horse” can be mighty dangerous under some circumstances.
//
//• Workouts. Workout angles, as they relate to recent races, can frequently reveal
// not only the state of a horse’s current condition, but a trainer’s intentions, as well.
//
//• Performance Angles. These are very important tools because these angles reveal
//the manner in which a horse has run his recent races. This sub-factor, of course,
//is very closely related to number three above.
//
//FORM FACTOR
//
//We’ll begin now by looking at two negative angles.
// The first is the Hard Race Last Start (HRLS) angle and
//the other is the Best Effort (BE) angle.
//
//Best Effort Angle
//
//This is a simple angle to understand. Whenever a horse in his LR has earned his best
// SR in his current chart when either winning the race or clearly trying to win it,
//he should be debited with this angle. This doesn’t always mean, however, that such
//an angle horse should always be automatically eliminated. We might find good reason
//to retain him – and actually even bet him! But nonetheless, just to keep my angles
//“ledger” straight, I always debited a horse with the angle whenever he qualified on
// the raw SR data.
//
//Generally speaking, any horse who won or finished within 3.5 lengths of the winner
//and earned its best SR in that race should be debited with this angle.
//
//Hard Race Last Start Angle
//
//This angle is a little bit harder to evaluate because it basically deals with the
//manner in which a horse’s recent bang-up races were run. In my “Introduction to Form”,
//I listed, as one of the primary determinants for evaluating probable effects of good
// races, the element of “duration of pressure”. This element to form evaluation deals
//primarily with the distance in which a horse either set or pressed the pace.
//Generally speaking, the closer up to the pace a horse ran, the tougher his race
// probably was. And any horse who runs to within 3.5 lengths of the leader for at
// least the first three calls should be considered a pacepresser. Of course, any
// horse who was leading at these points of call should be considered the pacesetter.
//
//Additionally, the longer the distance in which the horse was pressured (for either
//type of runner), the harder the race probably was, generally speaking. This is so
//because the horse expended more of his energy. The more energy he expended in that
// last good recent effort or so, the less he might have today to get the job done.
//
//
//But first, I’ll give everyone one more positive angle to add to your arsenal,
//if so inclined. This angle has to do with a “layoff” horse, and I call this kind of
// horse: Fresh Horse (FH).
//
//To qualify, a horse must have been laid off for a minimum of 30 days between
// his 2RB and LR; however, the layoff should not exceed more than 60 days.
//The reason for this is because anything more than 60 days could indicate that
// the horse has been recuperating from some ailment or physical problem.
//
//A Angle:
//
//Today
//
//LR was non-taxing race
//
//LR.OMF
//
//2RB.IMF
//
//2RB.DATE<=60 days from Today’s race
//
//
//BA Beaten A Angle
//
//Today
//
//LR FP<1
//
//2RB.OMF
//
//3RB.IMF
//
//When a BA has a DD double drop in claiming drop last and dropping today
//BA angle becomes a POWER angle + M angle
//
//-BA Shaded version of BA (This is a bit advanced and
//I am going to explore it once I know the simpler ones better.)
//
//BBA or Beaten BA Angle
//All this angle does is take the above one (the BA) a step further.
//This angle involves a horse who prior to his LR was a BA type.
//He became a BBA type when he lost his LR. I've posted charts of these kinds
// of horses, so it might help to read and have the charts of these angle horses
// in front of you.
//
//B Angle
//
//Today
//
//LR.OMF
//
//2RB.IMF
//
//BB3
//This is a combination angle, which I'll get into later. It has to do
//with the lengths off the leader at the SC in a horse's 3RB and how a trainer
// has entered his horse in terms of price/class today relative to that 3RB.
//It's a great long shot angle, but one that occurs, unfortunately, only infrequently.
//
//
//
//I haven't really explained the SOS (Speed On Speed) Syndrome. This has to do only
//with B angle horses. Since B types must have shown ES to at least the 2C in their 2RB,
// then this SOS "angle" demands that subsequent to that 2RB, the horse once again must
//demonstrate additional speed -- either with an early speed angle in the LR, such as
//the HW (early speed to the 2C), the ES (early speed to the SC) or even with the FC
//angle (early speed to the 1C only) -- although this is the weakest angle since in a
// sprint race you just can't be sure how far he carried that early speed. If he carried
// it to the 3/8 pole, that's fine. But if he only carried it for a ¼ mi.. --
// that's not so good. (I explained the weakness of the FC angle in sprints in some
//detail in the Add Heat race at SA. However, if the FC angle was in a route race,
//then this fine -- because in most routes the 1C is to at least the ½ mi. pole.
//
//Another way a horse could qualify on the SOS is through a "fast" workout (FW angle),
// which was given after his 2RB or after the LR -- doesn't matter which race.
//For a horse to qualify on the basis of a workout, he must have run to the following
//minimum times for these distances:
//
//3f or 4f work = :36 or :48 sec, respectively.
//5f work = 1:01
//6f work = 1:14
//
//99% of the time the workout distance will be one of the first three listed. A trainer
// will very rarely work his horse at a distance greater than 5f, while asking for speed.
//
//Of course, if you’re playing some track that’s really slow, deep or whatever – then you
// will probably have to adjust the above minimum times to account for the slowness of
//your track. Since I only played major tracks, this was never a problem for me.
//
//
//But first, I’ll give everyone one more positive angle to add to your arsenal,
//if so inclined. This angle has to do with a “layoff” horse, and I call this kind of
// horse: Fresh Horse (FH).
//
//To qualify, a horse must have been laid off for a minimum of 30 days between
// his 2RB and LR; however, the layoff should not exceed more than 60 days.
//The reason for this is because anything more than 60 days could indicate that
// the horse has been recuperating from some ailment or physical problem.
//
//
//Performance Angles: Front Running (FR) angle, which means the horse has the ability to
//get out and set the pace by at least the 2C of a race. And this race can be any in the
// horse’s current chart. This is a very desirable angle to have and we’ll look at this
// one more closely down the road.
//
//She was an A angle horse who came back in her LR to earn an 18-point lower SR.
//Not a good sign! The drop of so many points could be an indication that that 2RB
// took too much out of her.
//
//For your info, she was in a Progressive Regressive, type 2 (PR2) form cycle mode
// – one fairly common to A angle types. Note her SRs from the 4RB to the 2RB –
//all ascending, then she came back with a lower SR – but one that would have been
// too low for my liking.
//
//
//F angle
//Has been IMF 3 of last 4 races
//
//
//PGL
//position gain in lenghts
//to qualify must have passed 3 horse and gained 2 lenghts from 1C to FC
//
//
// VERIFIED CLAIM angle
//Bump up 100% or more off claim and must not have a Win at or Above claiming level
// he was claimed
//
//
//BX angle
//b angle horse 3rb and last 2 races must look poor and been OMF
//and bumping up in class and then dropping in class (DC)
//
//HC hidden condition (price getter)
//
//was closer up at 1C than 2C, gained lenghts & RP to SC
//to Qualify gain a minimum of 1 RP and 1 lenght from 2C to SC
//
// Feint (FE) angle.
//(This latter angle hasn't been studied yet on that thread).
//Suffice it to say, however, that in order to qualify,
//a horse must have been dropped in price-class in 2RB,
//bumped up in price-class in LR, then dropped back down today
//in price-class. This is a nifty little dodge some trainers employ
//to get a price on their well meant horse. It's used sometimes to
//throw the crowd off the scent of a live long shot. And this maneuver
//is pretty powerful when found in conjunction with certain performance angles.
//
