<?

/*
  HandicappingOS, Open Source Handicapping Solutions
  http://www.handicappingOS

  Copyright (c) 2005 Richard Rosa

  Released under the GNU General Public License
*/

// this is the detail related to the horses specific data as contained in the BRIS file. 
// for the race data see the race class. Each item that corresponds to this file has a property and 
// a corresponding DB entry. 


class entry
{

	var $entryID; 
	var $raceID; 
	var $postPosition;
	var $entry;
	var $horseClaimingPrice;
	var $breedType;
	var $tdyNasalStripChange;
	var $tdyTrainer;
	var $trainerStats;
	var $trainerWins;
	var $trainerPlaces;
	var $trainerShows;
	var $tdyJockey;
	var $apprenticeWgtallow;
	var $jockeySts;
	var $jockeyWins;
	var $jockeyPlaces;
	var $jockeyShows;
	var $tdyOwner;
	var $ownerSilks;
	var $MTO_AE;
	var $programNumber;
	var $morningLine;
	var $horseName;
	var $yearOfBirth;
	var $foalingMonth;
	var $sex;
	var $horseColor;
	var $weight;
	var $sire;
	var $sireSire;
	var $dam;
	var $damsSire;
	var $breeder;
	var $bredState;
	var $programPostPosition;
	var $todaysMeds1;
	var $todaysMeds2;
	var $equipmentChange;
	var $distStarts;
	var $distWins;
	var $distPlaces;
	var $distShows;
	var $distEarnings;
	var $trackStarts;
	var $trackWins;
	var $trackPlaces;
	var $trackShows;
	var $trackEarnings;
	var $turfStarts;
	var $turfWins;
	var $turfPlaces;
	var $turfShows;
	var $turfEarnings;
	var $wetStarts;
	var $wetWins;
	var $wetPlaces;
	var $wetShows;
	var $wetEarnings;
	var $curYear;
	var $curStarts;
	var $curWins;
	var $curPlaces;
	var $curShows;
	var $curEarnings;
	var $prevYear;
	var $prevStarts;
	var $prevWins;
	var $prevPlaces;
	var $prevShows;
	var $prevEarnings;
	var $lifeStarts;
	var $lifeWins;
	var $lifePlaces;
	var $lifeShows;
	var $lifeEarnings;
	var $dateWorkout1;
	var $dateWorkout2;
	var $dateWorkout3;
	var $dateWorkout4;
	var $dateWorkout5;
	var $dateWorkout6;
	var $dateWorkout7;
	var $dateWorkout8;
	var $dateWorkout9;
	var $dateWorkout10;
	var $dateWorkout11;
	var $dateWorkout12;
	var $timeWorkout1;
	var $timeWorkout2;
	var $timeWorkout3;
	var $timeWorkout4;
	var $timeWorkout5;
	var $timeWorkout6;
	var $timeWorkout7;
	var $timeWorkout8;
	var $timeWorkout9;
	var $timeWorkout10;
	var $timeWorkout11;
	var $timeWorkout12;
	var $trackWorkout1;
	var $trackWorkout2;
	var $trackWorkout3;
	var $trackWorkout4;
	var $trackWorkout5;
	var $trackWorkout6;
	var $trackWorkout7;
	var $trackWorkout8;
	var $trackWorkout9;
	var $trackWorkout10;
	var $trackWorkout11;
	var $trackWorkout12;
	var $distanceWorkout1;
	var $distanceWorkout2;
	var $distanceWorkout3;
	var $distanceWorkout4;
	var $distanceWorkout5;
	var $distanceWorkout6;
	var $distanceWorkout7;
	var $distanceWorkout8;
	var $distanceWorkout9;
	var $distanceWorkout10;
	var $distanceWorkout11;
	var $distanceWorkout12;
	var $conditionWorkout1;
	var $conditionWorkout2;
	var $conditionWorkout3;
	var $conditionWorkout4;
	var $conditionWorkout5;
	var $conditionWorkout6;
	var $conditionWorkout7;
	var $conditionWorkout8;
	var $conditionWorkout9;
	var $conditionWorkout10;
	var $conditionWorkout11;
	var $conditionWorkout12;
	var $describeWorkout1;
	var $describeWorkout2;
	var $describeWorkout3;
	var $describeWorkout4;
	var $describeWorkout5;
	var $describeWorkout6;
	var $describeWorkout7;
	var $describeWorkout8;
	var $describeWorkout9;
	var $describeWorkout10;
	var $describeWorkout11;
	var $describeWorkout12;
	var $innerIndicateWorkout1;
	var $innerIndicateWorkout2;
	var $innerIndicateWorkout3;
	var $innerIndicateWorkout4;
	var $innerIndicateWorkout5;
	var $innerIndicateWorkout6;
	var $innerIndicateWorkout7;
	var $innerIndicateWorkout8;
	var $innerIndicateWorkout9;
	var $innerIndicateWorkout10;
	var $innerIndicateWorkout11;
	var $innerIndicateWorkout12;
	var $numWorksWorkout1;
	var $numWorksWorkout2;
	var $numWorksWorkout3;
	var $numWorksWorkout4;
	var $numWorksWorkout5;
	var $numWorksWorkout6;
	var $numWorksWorkout7;
	var $numWorksWorkout8;
	var $numWorksWorkout9;
	var $numWorksWorkout10;
	var $numWorksWorkout11;
	var $numWorksWorkout12;
	var $rankWorkout1;
	var $rankWorkout2;
	var $rankWorkout3;
	var $rankWorkout4;
	var $rankWorkout5;
	var $rankWorkout6;
	var $rankWorkout7;
	var $rankWorkout8;
	var $rankWorkout9;
	var $rankWorkout10;
	var $rankWorkout11;
	var $rankWorkout12;
	var $BrisRunStyle;
	var $Quirin;
	var $daysSinceLastRace;
	var $BrisPrimePowerRating;
	var $ppRaceDate1;
	var $ppRaceDate2;
	var $ppRaceDate3;
	var $ppRaceDate4;
	var $ppRaceDate5;
	var $ppRaceDate6;
	var $ppRaceDate7;
	var $ppRaceDate8;
	var $ppRaceDate9;
	var $ppRaceDate10;
	var $ppDaysPrev1;
	var $ppDaysPrev2;
	var $ppDaysPrev3;
	var $ppDaysPrev4;
	var $ppDaysPrev5;
	var $ppDaysPrev6;
	var $ppDaysPrev7;
	var $ppDaysPrev8;
	var $ppDaysPrev9;
	var $ppDaysPrev10;
	var $ppTrackCode1;
	var $ppTrackCode2;
	var $ppTrackCode3;
	var $ppTrackCode4;
	var $ppTrackCode5;
	var $ppTrackCode6;
	var $ppTrackCode7;
	var $ppTrackCode8;
	var $ppTrackCode9;
	var $ppTrackCode10;
	var $ppBrisTrackCode1;
	var $ppBrisTrackCode2;
	var $ppBrisTrackCode3;
	var $ppBrisTrackCode4;
	var $ppBrisTrackCode5;
	var $ppBrisTrackCode6;
	var $ppBrisTrackCode7;
	var $ppBrisTrackCode8;
	var $ppBrisTrackCode9;
	var $ppBrisTrackCode10;
	var $ppRaceNum1;
	var $ppRaceNum2;
	var $ppRaceNum3;
	var $ppRaceNum4;
	var $ppRaceNum5;
	var $ppRaceNum6;
	var $ppRaceNum7;
	var $ppRaceNum8;
	var $ppRaceNum9;
	var $ppRaceNum10;
	var $ppTrackCond1;
	var $ppTrackCond2;
	var $ppTrackCond3;
	var $ppTrackCond4;
	var $ppTrackCond5;
	var $ppTrackCond6;
	var $ppTrackCond7;
	var $ppTrackCond8;
	var $ppTrackCond9;
	var $ppTrackCond10;
	var $ppDistanceYards1;
	var $ppDistanceYards2;
	var $ppDistanceYards3;
	var $ppDistanceYards4;
	var $ppDistanceYards5;
	var $ppDistanceYards6;
	var $ppDistanceYards7;
	var $ppDistanceYards8;
	var $ppDistanceYards9;
	var $ppDistanceYards10;
	var $ppSurface1;
	var $ppSurface2;
	var $ppSurface3;
	var $ppSurface4;
	var $ppSurface5;
	var $ppSurface6;
	var $ppSurface7;
	var $ppSurface8;
	var $ppSurface9;
	var $ppSurface10;
	var $ppSpecialChute1;
	var $ppSpecialChute2;
	var $ppSpecialChute3;
	var $ppSpecialChute4;
	var $ppSpecialChute5;
	var $ppSpecialChute6;
	var $ppSpecialChute7;
	var $ppSpecialChute8;
	var $ppSpecialChute9;
	var $ppSpecialChute10;
	var $ppNumEntrants1;
	var $ppNumEntrants2;
	var $ppNumEntrants3;
	var $ppNumEntrants4;
	var $ppNumEntrants5;
	var $ppNumEntrants6;
	var $ppNumEntrants7;
	var $ppNumEntrants8;
	var $ppNumEntrants9;
	var $ppNumEntrants10;
	var $ppPostPosition1;
	var $ppPostPosition2;
	var $ppPostPosition3;
	var $ppPostPosition4;
	var $ppPostPosition5;
	var $ppPostPosition6;
	var $ppPostPosition7;
	var $ppPostPosition8;
	var $ppPostPosition9;
	var $ppPostPosition10;
	var $ppEquipment1;
	var $ppEquipment2;
	var $ppEquipment3;
	var $ppEquipment4;
	var $ppEquipment5;
	var $ppEquipment6;
	var $ppEquipment7;
	var $ppEquipment8;
	var $ppEquipment9;
	var $ppEquipment10;
	var $ppReserved1_1;
	var $ppReserved1_2;
	var $ppReserved1_3;
	var $ppReserved1_4;
	var $ppReserved1_5;
	var $ppReserved1_6;
	var $ppReserved1_7;
	var $ppReserved1_8;
	var $ppReserved1_9;
	var $ppReserved1_10;
	var $ppMeds1;
	var $ppMeds2;
	var $ppMeds3;
	var $ppMeds4;
	var $ppMeds5;
	var $ppMeds6;
	var $ppMeds7;
	var $ppMeds8;
	var $ppMeds9;
	var $ppMeds10;
	var $ppTripComment1;
	var $ppTripComment2;
	var $ppTripComment3;
	var $ppTripComment4;
	var $ppTripComment5;
	var $ppTripComment6;
	var $ppTripComment7;
	var $ppTripComment8;
	var $ppTripComment9;
	var $ppTripComment10;
	var $ppWinnersName1;
	var $ppWinnersName2;
	var $ppWinnersName3;
	var $ppWinnersName4;
	var $ppWinnersName5;
	var $ppWinnersName6;
	var $ppWinnersName7;
	var $ppWinnersName8;
	var $ppWinnersName9;
	var $ppWinnersName10;
	var $pp2ndPlaceName1;
	var $pp2ndPlaceName2;
	var $pp2ndPlaceName3;
	var $pp2ndPlaceName4;
	var $pp2ndPlaceName5;
	var $pp2ndPlaceName6;
	var $pp2ndPlaceName7;
	var $pp2ndPlaceName8;
	var $pp2ndPlaceName9;
	var $pp2ndPlaceName10;
	var $pp3rdPlaceName1;
	var $pp3rdPlaceName2;
	var $pp3rdPlaceName3;
	var $pp3rdPlaceName4;
	var $pp3rdPlaceName5;
	var $pp3rdPlaceName6;
	var $pp3rdPlaceName7;
	var $pp3rdPlaceName8;
	var $pp3rdPlaceName9;
	var $pp3rdPlaceName10;
	var $ppWinnersWeight1;
	var $ppWinnersWeight2;
	var $ppWinnersWeight3;
	var $ppWinnersWeight4;
	var $ppWinnersWeight5;
	var $ppWinnersWeight6;
	var $ppWinnersWeight7;
	var $ppWinnersWeight8;
	var $ppWinnersWeight9;
	var $ppWinnersWeight10;
	var $pp2ndPlaceWeight1;
	var $pp2ndPlaceWeight2;
	var $pp2ndPlaceWeight3;
	var $pp2ndPlaceWeight4;
	var $pp2ndPlaceWeight5;
	var $pp2ndPlaceWeight6;
	var $pp2ndPlaceWeight7;
	var $pp2ndPlaceWeight8;
	var $pp2ndPlaceWeight9;
	var $pp2ndPlaceWeight10;
	var $pp3rdPlaceWeight1;
	var $pp3rdPlaceWeight2;
	var $pp3rdPlaceWeight3;
	var $pp3rdPlaceWeight4;
	var $pp3rdPlaceWeight5;
	var $pp3rdPlaceWeight6;
	var $pp3rdPlaceWeight7;
	var $pp3rdPlaceWeight8;
	var $pp3rdPlaceWeight9;
	var $pp3rdPlaceWeight10;
	var $ppWinnersMargin1;
	var $ppWinnersMargin2;
	var $ppWinnersMargin3;
	var $ppWinnersMargin4;
	var $ppWinnersMargin5;
	var $ppWinnersMargin6;
	var $ppWinnersMargin7;
	var $ppWinnersMargin8;
	var $ppWinnersMargin9;
	var $ppWinnersMargin10;
	var $pp2ndPlaceMargin1;
	var $pp2ndPlaceMargin2;
	var $pp2ndPlaceMargin3;
	var $pp2ndPlaceMargin4;
	var $pp2ndPlaceMargin5;
	var $pp2ndPlaceMargin6;
	var $pp2ndPlaceMargin7;
	var $pp2ndPlaceMargin8;
	var $pp2ndPlaceMargin9;
	var $pp2ndPlaceMargin10;
	var $pp3rdPlaceMargin1;
	var $pp3rdPlaceMargin2;
	var $pp3rdPlaceMargin3;
	var $pp3rdPlaceMargin4;
	var $pp3rdPlaceMargin5;
	var $pp3rdPlaceMargin6;
	var $pp3rdPlaceMargin7;
	var $pp3rdPlaceMargin8;
	var $pp3rdPlaceMargin9;
	var $pp3rdPlaceMargin10;
	var $ppExtraComment1;
	var $ppExtraComment2;
	var $ppExtraComment3;
	var $ppExtraComment4;
	var $ppExtraComment5;
	var $ppExtraComment6;
	var $ppExtraComment7;
	var $ppExtraComment8;
	var $ppExtraComment9;
	var $ppExtraComment10;
	var $ppWeight1;
	var $ppWeight2;
	var $ppWeight3;
	var $ppWeight4;
	var $ppWeight5;
	var $ppWeight6;
	var $ppWeight7;
	var $ppWeight8;
	var $ppWeight9;
	var $ppWeight10;
	var $ppOdds1;
	var $ppOdds2;
	var $ppOdds3;
	var $ppOdds4;
	var $ppOdds5;
	var $ppOdds6;
	var $ppOdds7;
	var $ppOdds8;
	var $ppOdds9;
	var $ppOdds10;
	var $ppEntry1;
	var $ppEntry2;
	var $ppEntry3;
	var $ppEntry4;
	var $ppEntry5;
	var $ppEntry6;
	var $ppEntry7;
	var $ppEntry8;
	var $ppEntry9;
	var $ppEntry10;
	var $ppRaceClassification1;
	var $ppRaceClassification2;
	var $ppRaceClassification3;
	var $ppRaceClassification4;
	var $ppRaceClassification5;
	var $ppRaceClassification6;
	var $ppRaceClassification7;
	var $ppRaceClassification8;
	var $ppRaceClassification9;
	var $ppRaceClassification10;
	var $ppClaimingPriceHorse1;
	var $ppClaimingPriceHorse2;
	var $ppClaimingPriceHorse3;
	var $ppClaimingPriceHorse4;
	var $ppClaimingPriceHorse5;
	var $ppClaimingPriceHorse6;
	var $ppClaimingPriceHorse7;
	var $ppClaimingPriceHorse8;
	var $ppClaimingPriceHorse9;
	var $ppClaimingPriceHorse10;
	var $ppPurse1;
	var $ppPurse2;
	var $ppPurse3;
	var $ppPurse4;
	var $ppPurse5;
	var $ppPurse6;
	var $ppPurse7;
	var $ppPurse8;
	var $ppPurse9;
	var $ppPurse10;
	var $ppStartingCallPos1;
	var $ppStartingCallPos2;
	var $ppStartingCallPos3;
	var $ppStartingCallPos4;
	var $ppStartingCallPos5;
	var $ppStartingCallPos6;
	var $ppStartingCallPos7;
	var $ppStartingCallPos8;
	var $ppStartingCallPos9;
	var $ppStartingCallPos10;
	var $ppFirstCallPos1;
	var $ppFirstCallPos2;
	var $ppFirstCallPos3;
	var $ppFirstCallPos4;
	var $ppFirstCallPos5;
	var $ppFirstCallPos6;
	var $ppFirstCallPos7;
	var $ppFirstCallPos8;
	var $ppFirstCallPos9;
	var $ppFirstCallPos10;
	var $ppSecondCallPos1;
	var $ppSecondCallPos2;
	var $ppSecondCallPos3;
	var $ppSecondCallPos4;
	var $ppSecondCallPos5;
	var $ppSecondCallPos6;
	var $ppSecondCallPos7;
	var $ppSecondCallPos8;
	var $ppSecondCallPos9;
	var $ppSecondCallPos10;
	var $ppReserved3_1;
	var $ppReserved3_2;
	var $ppReserved3_3;
	var $ppReserved3_4;
	var $ppReserved3_5;
	var $ppReserved3_6;
	var $ppReserved3_7;
	var $ppReserved3_8;
	var $ppReserved3_9;
	var $ppReserved3_10;
	var $ppStretchPos1;
	var $ppStretchPos2;
	var $ppStretchPos3;
	var $ppStretchPos4;
	var $ppStretchPos5;
	var $ppStretchPos6;
	var $ppStretchPos7;
	var $ppStretchPos8;
	var $ppStretchPos9;
	var $ppStretchPos10;
	var $ppFinishPos1;
	var $ppFinishPos2;
	var $ppFinishPos3;
	var $ppFinishPos4;
	var $ppFinishPos5;
	var $ppFinishPos6;
	var $ppFinishPos7;
	var $ppFinishPos8;
	var $ppFinishPos9;
	var $ppFinishPos10;
	var $ppMoneyPos1;
	var $ppMoneyPos2;
	var $ppMoneyPos3;
	var $ppMoneyPos4;
	var $ppMoneyPos5;
	var $ppMoneyPos6;
	var $ppMoneyPos7;
	var $ppMoneyPos8;
	var $ppMoneyPos9;
	var $ppMoneyPos10;
	var $ppStartCallBeatenMargin1;
	var $ppStartCallBeatenMargin2;
	var $ppStartCallBeatenMargin3;
	var $ppStartCallBeatenMargin4;
	var $ppStartCallBeatenMargin5;
	var $ppStartCallBeatenMargin6;
	var $ppStartCallBeatenMargin7;
	var $ppStartCallBeatenMargin8;
	var $ppStartCallBeatenMargin9;
	var $ppStartCallBeatenMargin10;
	var $ppStartCallBeaten1;
	var $ppStartCallBeaten2;
	var $ppStartCallBeaten3;
	var $ppStartCallBeaten4;
	var $ppStartCallBeaten5;
	var $ppStartCallBeaten6;
	var $ppStartCallBeaten7;
	var $ppStartCallBeaten8;
	var $ppStartCallBeaten9;
	var $ppStartCallBeaten10;
	var $ppFirstCallBeatenMargin1;
	var $ppFirstCallBeatenMargin2;
	var $ppFirstCallBeatenMargin3;
	var $ppFirstCallBeatenMargin4;
	var $ppFirstCallBeatenMargin5;
	var $ppFirstCallBeatenMargin6;
	var $ppFirstCallBeatenMargin7;
	var $ppFirstCallBeatenMargin8;
	var $ppFirstCallBeatenMargin9;
	var $ppFirstCallBeatenMargin10;
	var $ppFirstCallBeaten1;
	var $ppFirstCallBeaten2;
	var $ppFirstCallBeaten3;
	var $ppFirstCallBeaten4;
	var $ppFirstCallBeaten5;
	var $ppFirstCallBeaten6;
	var $ppFirstCallBeaten7;
	var $ppFirstCallBeaten8;
	var $ppFirstCallBeaten9;
	var $ppFirstCallBeaten10;
	var $ppSecondCallBeatenMargin1;
	var $ppSecondCallBeatenMargin2;
	var $ppSecondCallBeatenMargin3;
	var $ppSecondCallBeatenMargin4;
	var $ppSecondCallBeatenMargin5;
	var $ppSecondCallBeatenMargin6;
	var $ppSecondCallBeatenMargin7;
	var $ppSecondCallBeatenMargin8;
	var $ppSecondCallBeatenMargin9;
	var $ppSecondCallBeatenMargin10;
	var $ppSecondCallBeaten1;
	var $ppSecondCallBeaten2;
	var $ppSecondCallBeaten3;
	var $ppSecondCallBeaten4;
	var $ppSecondCallBeaten5;
	var $ppSecondCallBeaten6;
	var $ppSecondCallBeaten7;
	var $ppSecondCallBeaten8;
	var $ppSecondCallBeaten9;
	var $ppSecondCallBeaten10;
	var $ppReserved4_1;
	var $ppReserved4_2;
	var $ppReserved4_3;
	var $ppReserved4_4;
	var $ppReserved4_5;
	var $ppReserved4_6;
	var $ppReserved4_7;
	var $ppReserved4_8;
	var $ppReserved4_9;
	var $ppReserved4_10;
	var $ppReserved5_1;
	var $ppReserved5_2;
	var $ppReserved5_3;
	var $ppReserved5_4;
	var $ppReserved5_5;
	var $ppReserved5_6;
	var $ppReserved5_7;
	var $ppReserved5_8;
	var $ppReserved5_9;
	var $ppReserved5_10;
	var $ppStretchBeatenMargin1;
	var $ppStretchBeatenMargin2;
	var $ppStretchBeatenMargin3;
	var $ppStretchBeatenMargin4;
	var $ppStretchBeatenMargin5;
	var $ppStretchBeatenMargin6;
	var $ppStretchBeatenMargin7;
	var $ppStretchBeatenMargin8;
	var $ppStretchBeatenMargin9;
	var $ppStretchBeatenMargin10;
	var $ppStretchBeaten1;
	var $ppStretchBeaten2;
	var $ppStretchBeaten3;
	var $ppStretchBeaten4;
	var $ppStretchBeaten5;
	var $ppStretchBeaten6;
	var $ppStretchBeaten7;
	var $ppStretchBeaten8;
	var $ppStretchBeaten9;
	var $ppStretchBeaten10;
	var $ppFinishBeatenMargin1;
	var $ppFinishBeatenMargin2;
	var $ppFinishBeatenMargin3;
	var $ppFinishBeatenMargin4;
	var $ppFinishBeatenMargin5;
	var $ppFinishBeatenMargin6;
	var $ppFinishBeatenMargin7;
	var $ppFinishBeatenMargin8;
	var $ppFinishBeatenMargin9;
	var $ppFinishBeatenMargin10;
	var $ppFinishBeaten1;
	var $ppFinishBeaten2;
	var $ppFinishBeaten3;
	var $ppFinishBeaten4;
	var $ppFinishBeaten5;
	var $ppFinishBeaten6;
	var $ppFinishBeaten7;
	var $ppFinishBeaten8;
	var $ppFinishBeaten9;
	var $ppFinishBeaten10;
	var $ppReserved6_1;
	var $ppReserved6_2;
	var $ppReserved6_3;
	var $ppReserved6_4;
	var $ppReserved6_5;
	var $ppReserved6_6;
	var $ppReserved6_7;
	var $ppReserved6_8;
	var $ppReserved6_9;
	var $ppReserved6_10;
	var $ppBris2fPaceRating1;
	var $ppBris2fPaceRating2;
	var $ppBris2fPaceRating3;
	var $ppBris2fPaceRating4;
	var $ppBris2fPaceRating5;
	var $ppBris2fPaceRating6;
	var $ppBris2fPaceRating7;
	var $ppBris2fPaceRating8;
	var $ppBris2fPaceRating9;
	var $ppBris2fPaceRating10;
	var $ppBris4fPaceRating1;
	var $ppBris4fPaceRating2;
	var $ppBris4fPaceRating3;
	var $ppBris4fPaceRating4;
	var $ppBris4fPaceRating5;
	var $ppBris4fPaceRating6;
	var $ppBris4fPaceRating7;
	var $ppBris4fPaceRating8;
	var $ppBris4fPaceRating9;
	var $ppBris4fPaceRating10;
	var $ppBris6fPaceRating1;
	var $ppBris6fPaceRating2;
	var $ppBris6fPaceRating3;
	var $ppBris6fPaceRating4;
	var $ppBris6fPaceRating5;
	var $ppBris6fPaceRating6;
	var $ppBris6fPaceRating7;
	var $ppBris6fPaceRating8;
	var $ppBris6fPaceRating9;
	var $ppBris6fPaceRating10;
	var $ppBris8fPaceRating1;
	var $ppBris8fPaceRating2;
	var $ppBris8fPaceRating3;
	var $ppBris8fPaceRating4;
	var $ppBris8fPaceRating5;
	var $ppBris8fPaceRating6;
	var $ppBris8fPaceRating7;
	var $ppBris8fPaceRating8;
	var $ppBris8fPaceRating9;
	var $ppBris8fPaceRating10;
	var $ppBris10fPaceRating1;
	var $ppBris10fPaceRating2;
	var $ppBris10fPaceRating3;
	var $ppBris10fPaceRating4;
	var $ppBris10fPaceRating5;
	var $ppBris10fPaceRating6;
	var $ppBris10fPaceRating7;
	var $ppBris10fPaceRating8;
	var $ppBris10fPaceRating9;
	var $ppBris10fPaceRating10;
	var $ppBrisLatePaceRating1;
	var $ppBrisLatePaceRating2;
	var $ppBrisLatePaceRating3;
	var $ppBrisLatePaceRating4;
	var $ppBrisLatePaceRating5;
	var $ppBrisLatePaceRating6;
	var $ppBrisLatePaceRating7;
	var $ppBrisLatePaceRating8;
	var $ppBrisLatePaceRating9;
	var $ppBrisLatePaceRating10;
	var $ppReserved7_1;
	var $ppReserved7_2;
	var $ppReserved7_3;
	var $ppReserved7_4;
	var $ppReserved7_5;
	var $ppReserved7_6;
	var $ppReserved7_7;
	var $ppReserved7_8;
	var $ppReserved7_9;
	var $ppReserved7_10;
	var $ppReserved8_1;
	var $ppReserved8_2;
	var $ppReserved8_3;
	var $ppReserved8_4;
	var $ppReserved8_5;
	var $ppReserved8_6;
	var $ppReserved8_7;
	var $ppReserved8_8;
	var $ppReserved8_9;
	var $ppReserved8_10;
	var $ppBrisSpeedRating1;
	var $ppBrisSpeedRating2;
	var $ppBrisSpeedRating3;
	var $ppBrisSpeedRating4;
	var $ppBrisSpeedRating5;
	var $ppBrisSpeedRating6;
	var $ppBrisSpeedRating7;
	var $ppBrisSpeedRating8;
	var $ppBrisSpeedRating9;
	var $ppBrisSpeedRating10;
	var $ppDRFSpeedRating1;
	var $ppDRFSpeedRating2;
	var $ppDRFSpeedRating3;
	var $ppDRFSpeedRating4;
	var $ppDRFSpeedRating5;
	var $ppDRFSpeedRating6;
	var $ppDRFSpeedRating7;
	var $ppDRFSpeedRating8;
	var $ppDRFSpeedRating9;
	var $ppDRFSpeedRating10;
	var $ppDRFTrackVariant1;
	var $ppDRFTrackVariant2;
	var $ppDRFTrackVariant3;
	var $ppDRFTrackVariant4;
	var $ppDRFTrackVariant5;
	var $ppDRFTrackVariant6;
	var $ppDRFTrackVariant7;
	var $ppDRFTrackVariant8;
	var $ppDRFTrackVariant9;
	var $ppDRFTrackVariant10;
	var $pp2fFraction1;
	var $pp2fFraction2;
	var $pp2fFraction3;
	var $pp2fFraction4;
	var $pp2fFraction5;
	var $pp2fFraction6;
	var $pp2fFraction7;
	var $pp2fFraction8;
	var $pp2fFraction9;
	var $pp2fFraction10;
	var $pp3fFraction1;
	var $pp3fFraction2;
	var $pp3fFraction3;
	var $pp3fFraction4;
	var $pp3fFraction5;
	var $pp3fFraction6;
	var $pp3fFraction7;
	var $pp3fFraction8;
	var $pp3fFraction9;
	var $pp3fFraction10;
	var $pp4fFraction1;
	var $pp4fFraction2;
	var $pp4fFraction3;
	var $pp4fFraction4;
	var $pp4fFraction5;
	var $pp4fFraction6;
	var $pp4fFraction7;
	var $pp4fFraction8;
	var $pp4fFraction9;
	var $pp4fFraction10;
	var $pp5fFraction1;
	var $pp5fFraction2;
	var $pp5fFraction3;
	var $pp5fFraction4;
	var $pp5fFraction5;
	var $pp5fFraction6;
	var $pp5fFraction7;
	var $pp5fFraction8;
	var $pp5fFraction9;
	var $pp5fFraction10;
	var $pp6fFraction1;
	var $pp6fFraction2;
	var $pp6fFraction3;
	var $pp6fFraction4;
	var $pp6fFraction5;
	var $pp6fFraction6;
	var $pp6fFraction7;
	var $pp6fFraction8;
	var $pp6fFraction9;
	var $pp6fFraction10;
	var $pp7fFraction1;
	var $pp7fFraction2;
	var $pp7fFraction3;
	var $pp7fFraction4;
	var $pp7fFraction5;
	var $pp7fFraction6;
	var $pp7fFraction7;
	var $pp7fFraction8;
	var $pp7fFraction9;
	var $pp7fFraction10;
	var $pp8fFraction1;
	var $pp8fFraction2;
	var $pp8fFraction3;
	var $pp8fFraction4;
	var $pp8fFraction5;
	var $pp8fFraction6;
	var $pp8fFraction7;
	var $pp8fFraction8;
	var $pp8fFraction9;
	var $pp8fFraction10;
	var $pp10fFraction1;
	var $pp10fFraction2;
	var $pp10fFraction3;
	var $pp10fFraction4;
	var $pp10fFraction5;
	var $pp10fFraction6;
	var $pp10fFraction7;
	var $pp10fFraction8;
	var $pp10fFraction9;
	var $pp10fFraction10;
	var $pp12fFraction1;
	var $pp12fFraction2;
	var $pp12fFraction3;
	var $pp12fFraction4;
	var $pp12fFraction5;
	var $pp12fFraction6;
	var $pp12fFraction7;
	var $pp12fFraction8;
	var $pp12fFraction9;
	var $pp12fFraction10;
	var $pp14fFraction1;
	var $pp14fFraction2;
	var $pp14fFraction3;
	var $pp14fFraction4;
	var $pp14fFraction5;
	var $pp14fFraction6;
	var $pp14fFraction7;
	var $pp14fFraction8;
	var $pp14fFraction9;
	var $pp14fFraction10;
	var $pp16fFraction1;
	var $pp16fFraction2;
	var $pp16fFraction3;
	var $pp16fFraction4;
	var $pp16fFraction5;
	var $pp16fFraction6;
	var $pp16fFraction7;
	var $pp16fFraction8;
	var $pp16fFraction9;
	var $pp16fFraction10;
	var $ppFirstFraction1;
	var $ppFirstFraction2;
	var $ppFirstFraction3;
	var $ppFirstFraction4;
	var $ppFirstFraction5;
	var $ppFirstFraction6;
	var $ppFirstFraction7;
	var $ppFirstFraction8;
	var $ppFirstFraction9;
	var $ppFirstFraction10;
	var $ppSecondFraction1;
	var $ppSecondFraction2;
	var $ppSecondFraction3;
	var $ppSecondFraction4;
	var $ppSecondFraction5;
	var $ppSecondFraction6;
	var $ppSecondFraction7;
	var $ppSecondFraction8;
	var $ppSecondFraction9;
	var $ppSecondFraction10;
	var $ppThirdFraction1;
	var $ppThirdFraction2;
	var $ppThirdFraction3;
	var $ppThirdFraction4;
	var $ppThirdFraction5;
	var $ppThirdFraction6;
	var $ppThirdFraction7;
	var $ppThirdFraction8;
	var $ppThirdFraction9;
	var $ppThirdFraction10;
	var $ppReserved9_1;
	var $ppReserved9_2;
	var $ppReserved9_3;
	var $ppReserved9_4;
	var $ppReserved9_5;
	var $ppReserved9_6;
	var $ppReserved9_7;
	var $ppReserved9_8;
	var $ppReserved9_9;
	var $ppReserved9_10;
	var $ppReserved10_1;
	var $ppReserved10_2;
	var $ppReserved10_3;
	var $ppReserved10_4;
	var $ppReserved10_5;
	var $ppReserved10_6;
	var $ppReserved10_7;
	var $ppReserved10_8;
	var $ppReserved10_9;
	var $ppReserved10_10;
	var $ppFinalTime1;
	var $ppFinalTime2;
	var $ppFinalTime3;
	var $ppFinalTime4;
	var $ppFinalTime5;
	var $ppFinalTime6;
	var $ppFinalTime7;
	var $ppFinalTime8;
	var $ppFinalTime9;
	var $ppFinalTime10;
	var $ppClaimedCode1;
	var $ppClaimedCode2;
	var $ppClaimedCode3;
	var $ppClaimedCode4;
	var $ppClaimedCode5;
	var $ppClaimedCode6;
	var $ppClaimedCode7;
	var $ppClaimedCode8;
	var $ppClaimedCode9;
	var $ppClaimedCode10;
	var $ppTrainer1;
	var $ppTrainer2;
	var $ppTrainer3;
	var $ppTrainer4;
	var $ppTrainer5;
	var $ppTrainer6;
	var $ppTrainer7;
	var $ppTrainer8;
	var $ppTrainer9;
	var $ppTrainer10;
	var $ppJockey1;
	var $ppJockey2;
	var $ppJockey3;
	var $ppJockey4;
	var $ppJockey5;
	var $ppJockey6;
	var $ppJockey7;
	var $ppJockey8;
	var $ppJockey9;
	var $ppJockey10;
	var $ppApprenticeWgtAllow1;
	var $ppApprenticeWgtAllow2;
	var $ppApprenticeWgtAllow3;
	var $ppApprenticeWgtAllow4;
	var $ppApprenticeWgtAllow5;
	var $ppApprenticeWgtAllow6;
	var $ppApprenticeWgtAllow7;
	var $ppApprenticeWgtAllow8;
	var $ppApprenticeWgtAllow9;
	var $ppApprenticeWgtAllow10;
	var $ppRaceType1;
	var $ppRaceType2;
	var $ppRaceType3;
	var $ppRaceType4;
	var $ppRaceType5;
	var $ppRaceType6;
	var $ppRaceType7;
	var $ppRaceType8;
	var $ppRaceType9;
	var $ppRaceType10;
	var $ppAgeSexRestrict1;
	var $ppAgeSexRestrict2;
	var $ppAgeSexRestrict3;
	var $ppAgeSexRestrict4;
	var $ppAgeSexRestrict5;
	var $ppAgeSexRestrict6;
	var $ppAgeSexRestrict7;
	var $ppAgeSexRestrict8;
	var $ppAgeSexRestrict9;
	var $ppAgeSexRestrict10;
	var $ppStateBredFlag1;
	var $ppStateBredFlag2;
	var $ppStateBredFlag3;
	var $ppStateBredFlag4;
	var $ppStateBredFlag5;
	var $ppStateBredFlag6;
	var $ppStateBredFlag7;
	var $ppStateBredFlag8;
	var $ppStateBredFlag9;
	var $ppStateBredFlag10;
	var $ppRestrictedQualifierFlag1;
	var $ppRestrictedQualifierFlag2;
	var $ppRestrictedQualifierFlag3;
	var $ppRestrictedQualifierFlag4;
	var $ppRestrictedQualifierFlag5;
	var $ppRestrictedQualifierFlag6;
	var $ppRestrictedQualifierFlag7;
	var $ppRestrictedQualifierFlag8;
	var $ppRestrictedQualifierFlag9;
	var $ppRestrictedQualifierFlag10;
	var $ppFavoriteIndicator1;
	var $ppFavoriteIndicator2;
	var $ppFavoriteIndicator3;
	var $ppFavoriteIndicator4;
	var $ppFavoriteIndicator5;
	var $ppFavoriteIndicator6;
	var $ppFavoriteIndicator7;
	var $ppFavoriteIndicator8;
	var $ppFavoriteIndicator9;
	var $ppFavoriteIndicator10;
	var $ppFrontBandages1;
	var $ppFrontBandages2;
	var $ppFrontBandages3;
	var $ppFrontBandages4;
	var $ppFrontBandages5;
	var $ppFrontBandages6;
	var $ppFrontBandages7;
	var $ppFrontBandages8;
	var $ppFrontBandages9;
	var $ppFrontBandages10;
	var $trainerCurStarts;
	var $trainerCurWins;
	var $trainerCurPlaces;
	var $TrainerCurShows;
	var $trainerCurROI;
	var $trainerPrevStarts;
	var $trainerPrevWins;
	var $trainerPrevPlaces;
	var $TrainerPrevShows;
	var $trainerPrevROI;
	var $jockeyCurStarts;
	var $jockeyCurWins;
	var $jockeyCurPlaces;
	var $jockeyCurShows;
	var $jockeyCurROI;
	var $jockeyPrevStarts;
	var $jockeyPrevWins;
	var $jockeyPrevPlaces;
	var $jockeyPrevShows;
	var $jockeyPrevROI;
	var $brisSpeedParForClass1;
	var $brisSpeedParForClass2;
	var $brisSpeedParForClass3;
	var $brisSpeedParForClass4;
	var $brisSpeedParForClass5;
	var $brisSpeedParForClass6;
	var $brisSpeedParForClass7;
	var $brisSpeedParForClass8;
	var $brisSpeedParForClass9;
	var $brisSpeedParForClass10;
	var $sireStudFee;
	var $bestBrisFastTrack;
	var $bestBrisTurf;
	var $bestBrisOff;
	var $bestBrisDistance;
	var $barShoe1;
	var $barShoe2;
	var $barShoe3;
	var $barShoe4;
	var $barShoe5;
	var $barShoe6;
	var $barShoe7;
	var $barShoe8;
	var $barShoe9;
	var $barShoe10;
	var $companyLineCode1;
	var $companyLineCode2;
	var $companyLineCode3;
	var $companyLineCode4;
	var $companyLineCode5;
	var $companyLineCode6;
	var $companyLineCode7;
	var $companyLineCode8;
	var $companyLineCode9;
	var $companyLineCode10;
	var $lowClaimingPriceOfRace1;
	var $lowClaimingPriceOfRace2;
	var $lowClaimingPriceOfRace3;
	var $lowClaimingPriceOfRace4;
	var $lowClaimingPriceOfRace5;
	var $lowClaimingPriceOfRace6;
	var $lowClaimingPriceOfRace7;
	var $lowClaimingPriceOfRace8;
	var $lowClaimingPriceOfRace9;
	var $lowClaimingPriceOfRace10;
	var $highClaimingPriceOfRace1;
	var $highClaimingPriceOfRace2;
	var $highClaimingPriceOfRace3;
	var $highClaimingPriceOfRace4;
	var $highClaimingPriceOfRace5;
	var $highClaimingPriceOfRace6;
	var $highClaimingPriceOfRace7;
	var $highClaimingPriceOfRace8;
	var $highClaimingPriceOfRace9;
	var $highClaimingPriceOfRace10;
	var $auctionPrice;
	var $whenWhereAuction;
	var $brisDirtPedigreeRating;
	var $brisMudPedigreeRating;
	var $brisTurfPedigreeRating;
	var $brisDistPedigreeRating;
	var $bestBrisLife;
	var $bestBrisMostRecentYear;
	var $bestBrisPastYear;
	var $bestBrisTrack;
	var $starts;
	var $wins;
	var $places;
	var $shows;
	var $earnings;
	var $keyTrainerStatCategory1;
	var $keyTrainerStatStarts1;
	var $keyTrainerStatWinPct1;
	var $keyTrainerStatITM1;
	var $keyTrainerStatROI1;
	var $keyTrainerStatCategory2;
	var $keyTrainerStatStarts2;
	var $keyTrainerStatWinPct2;
	var $keyTrainerStatITM2;
	var $keyTrainerStatROI2;
	var $keyTrainerStatCategory3;
	var $keyTrainerStatStarts3;
	var $keyTrainerStatWinPct3;
	var $keyTrainerStatITM3;
	var $keyTrainerStatROI3;
	var $keyTrainerStatCategory4;
	var $keyTrainerStatStarts4;
	var $keyTrainerStatWinPct4;
	var $keyTrainerStatITM4;
	var $keyTrainerStatROI4;
	var $keyTrainerStatCategory5;
	var $keyTrainerStatStarts5;
	var $keyTrainerStatWinPct5;
	var $keyTrainerStatITM5;
	var $keyTrainerStatROI5;
	var $keyTrainerStatCategory6;
	var $keyTrainerStatStarts6;
	var $keyTrainerStatWinPct6;
	var $keyTrainerStatITM6;
	var $keyTrainerStatROI6;
	var $jockeyDistanceOnTurfLabel;
	var $jockeyDistanceOnTurfStarts;
	var $jockeyDistanceOnTurfWins;
	var $jockeyDistanceOnTurfPlaces;
	var $jockeyDistanceOnTurfShows;
	var $jockeyDistanceOnTurfROI;
	var $jockeyDistanceOnTurfEarnings; 
	var $scratched; 
	var $contender;
	var $comments; 
	var $wager; 
	var $payout; 

	var	$pp_fields = array( 
         "ppRaceDate", "ppDaysPrev", "ppTrackCode", "ppBrisTrackCode", "ppRaceNum", "ppTrackCond",
	     "ppDistanceYards", "ppSurface", "ppSpecialChute", "ppNumEntrants", "ppPostPosition",
	     "ppEquipment", "ppMeds", "ppTripComment", "ppWinnersName", "pp2ndPlaceName", "pp3rdPlaceName",  
	     "ppWinnersWeight", "pp2ndPlaceWeight", "pp3rdPlaceWeight", "ppWinnersMargin", "pp2ndPlaceMargin",
	     "pp3rdPlaceMargin", "ppExtraComment", "ppWeight", "ppOdds", "ppEntry", "ppRaceClassification",	     
	     "ppClaimingPriceHorse", "ppPurse", "ppStartingCallPos", "ppFirstCallPos", "ppSecondCallPos", "ppStretchPos",	     
   	     "ppFinishPos", "ppMoneyPos", "ppStartCallBeatenMargin", "ppStartCallBeaten", "ppFirstCallBeatenMargin",	     
   	     "ppFirstCallBeaten", "ppSecondCallBeatenMargin", "ppSecondCallBeaten","ppStretchBeatenMargin",	     
   	     "ppStretchBeaten", "ppFinishBeatenMargin", "ppFinishBeaten", "ppBris2fPaceRating", "ppBris4fPaceRating",	     
   	     "ppBris6fPaceRating", "ppBris8fPaceRating", "ppBris10fPaceRating", "ppBrisLatePaceRating",	     
   	     "ppBrisSpeedRating", "ppDRFSpeedRating", "ppDRFTrackVariant", "pp2fFraction", "pp3fFraction",	     
   	     "pp4fFraction", "pp5fFraction", "pp6fFraction", "pp7fFraction", "pp8fFraction", "pp10fFraction",	     
   	     "pp12fFraction", "pp14fFraction", "pp16fFraction", "ppFirstFraction", "ppSecondFraction",	     
   	     "ppThirdFraction", "ppFinalTime", "ppClaimedCode", "ppTrainer", "ppJockey", "ppApprenticeWgtAllow",	     
   	     "ppRaceType", "ppAgeSexRestrict", "ppStateBredFlag", "ppRestrictedQualifierFlag", "ppFavoriteIndicator",	     
   	     "ppFrontBandages", "brisSpeedParForClass", "barShoe", "companyLineCode", "lowClaimingPriceOfRace", 
   	     "highClaimingPriceOfRace", "selected"); 

   	var $entry_fields =  array("entryID", "raceID", "postPosition", "entry", "horseClaimingPrice", "breedType", "tdyNasalStripChange", "tdyTrainer", 
		 "trainerStats", "trainerWins", "trainerPlaces", "trainerShows", "tdyJockey", "apprenticeWgtallow", 
         "jockeySts", "jockeyWins", "jockeyPlaces", "jockeyShows", "tdyOwner", "ownerSilks", "MTO_AE", 
         "programNumber", "morningLine", "horseName", "yearOfBirth", "foalingMonth", "sex", "horseColor",  
         "weight", "sire", "sireSire", "dam", "damsSire", "breeder", "bredState", "programPostPosition", 
         "todaysMeds1", "todaysMeds2", "equipmentChange", "distStarts", "distWins", "distPlaces", 
         "distShows", "distEarnings", "trackStarts", "trackWins", "trackPlaces", "trackShows", "trackEarnings",  
         "turfStarts", "turfWins", "turfPlaces", "turfShows", "turfEarnings", "wetStarts", "wetWins", "wetPlaces",  
         "wetShows", "wetEarnings", "curYear", "curStarts", "curWins", "curPlaces", "curShows", "curEarnings", 
         "prevYear", "prevStarts", "prevWins", "prevPlaces", "prevShows", "prevEarnings", "lifeStarts", 
         "lifeWins", "lifePlaces", "lifeShows", "lifeEarnings", "BrisRunStyle", "Quirin", "daysSinceLastRace",  
         "BrisPrimePowerRating", "trainerCurStarts", "trainerCurWins", "trainerCurPlaces", "TrainerCurShows", 
         "trainerCurROI", "trainerPrevStarts", "trainerPrevWins", "trainerPrevPlaces", "TrainerPrevShows", 
         "trainerPrevROI", "jockeyCurStarts", "jockeyCurWins", "jockeyCurPlaces", "jockeyCurShows", 
         "jockeyCurROI", "jockeyPrevStarts", "jockeyPrevWins", "jockeyPrevPlaces", "jockeyPrevShows",  
         "jockeyPrevROI", "sireStudFee", "bestBrisFastTrack", "bestBrisTurf", "bestBrisOff", "bestBrisDistance",  
         "auctionPrice", "whenWhereAuction", "brisDirtPedigreeRating", "brisMudPedigreeRating", 
         "brisTurfPedigreeRating", "brisDistPedigreeRating", "bestBrisLife", "bestBrisMostRecentYear",  
         "bestBrisPastYear", "bestBrisTrack", "starts", "wins", "places", "shows", "earnings", 
         "jockeyDistanceOnTurfLabel", "jockeyDistanceOnTurfStarts", "jockeyDistanceOnTurfWins", 
         "jockeyDistanceOnTurfPlaces", "jockeyDistanceOnTurfShows", "jockeyDistanceOnTurfROI",  
         "jockeyDistanceOnTurfEarnings", "scratched", "contender", "comments", "wager", "payout");      
   
     var $workout_fields = array("dateWorkout", "timeWorkout",  "trackWorkout", "distanceWorkout", "conditionWorkout", 
		 "describeWorkout", "innerIndicateWorkout", "numWorksWorkout", "rankWorkout");
     var $ts_fields = array("keyTrainerStatCategory", "keyTrainerStatStarts", "keyTrainerStatWinPct", 
     	 "keyTrainerStatITM", "keyTrainerStatROI");
     var $jockeyStats_fields = array("jockeyDistanceOnTurfLabel", "jockeyDistanceOnTurfStarts", "jockeyDistanceOnTurfWins", 
          "jockeyDistanceOnTurfPlaces", "jockeyDistanceOnTurfShows", "jockeyDistanceOnTurfROI", 
          "jockeyDistanceOnTurfEarnings"); 	  

		  
     
    function entry($entryID = "") {
	
		global $debug;
		$this->entryID = $entryID; 

		
	}

    function init_entry ($entry, $raceID) {

		$this->raceID = $raceID; 
		$this->postPosition = $entry['postPosition'];
		$this->entry = $entry['entry'];
		$this->horseClaimingPrice = $entry['horseClaimingPrice'];
		$this->breedType = $entry['breedType'];
		$this->tdyNasalStripChange = $entry['tdyNasalStripChange'];
		$this->tdyTrainer = $entry['tdyTrainer'];
		$this->trainerStats = $entry['trainerStats'];
		$this->trainerWins = $entry['trainerWins'];
		$this->trainerPlaces = $entry['trainerPlaces'];
		$this->trainerShows = $entry['trainerShows'];
		$this->tdyJockey = $entry['tdyJockey'];
		$this->apprenticeWgtallow = $entry['apprenticeWgtallow'];
		$this->jockeySts = $entry['jockeySts'];
		$this->jockeyWins = $entry['jockeyWins'];
		$this->jockeyPlaces = $entry['jockeyPlaces'];
		$this->jockeyShows = $entry['jockeyShows'];
		$this->tdyOwner = $entry['tdyOwner'];
		$this->ownerSilks = $entry['ownerSilks'];
		$this->MTO_AE = $entry['MTO_AE'];
		$this->programNumber = $entry['programNumber'];
		$this->morningLine = $entry['morningLine'];
		$this->horseName = $entry['horseName'];
		$this->yearOfBirth = $entry['yearOfBirth'];
		$this->foalingMonth = $entry['foalingMonth'];
		$this->sex = $entry['sex'];
		$this->horseColor = $entry['horseColor'];
		$this->weight = $entry['weight'];
		$this->sire = $entry['sire'];
		$this->sireSire = $entry['sireSire'];
		$this->dam = $entry['dam'];
		$this->damsSire = $entry['damsSire'];
		$this->breeder = $entry['breeder'];
		$this->bredState = $entry['bredState'];
		$this->programPostPosition = $entry['programPostPosition'];
		$this->todaysMeds1 = $entry['todaysMeds1'];
		$this->todaysMeds2 = $entry['todaysMeds2'];
		$this->equipmentChange = $entry['equipmentChange'];
		$this->distStarts = $entry['distStarts'];
		$this->distWins = $entry['distWins'];
		$this->distPlaces = $entry['distPlaces'];
		$this->distShows = $entry['distShows'];
		$this->distEarnings = $entry['distEarnings'];
		$this->trackStarts = $entry['trackStarts'];
		$this->trackWins = $entry['trackWins'];
		$this->trackPlaces = $entry['trackPlaces'];
		$this->trackShows = $entry['trackShows'];
		$this->trackEarnings = $entry['trackEarnings'];
		$this->turfStarts = $entry['turfStarts'];
		$this->turfWins = $entry['turfWins'];
		$this->turfPlaces = $entry['turfPlaces'];
		$this->turfShows = $entry['turfShows'];
		$this->turfEarnings = $entry['turfEarnings'];
		$this->wetStarts = $entry['wetStarts'];
		$this->wetWins = $entry['wetWins'];
		$this->wetPlaces = $entry['wetPlaces'];
		$this->wetShows = $entry['wetShows'];
		$this->wetEarnings = $entry['wetEarnings'];
		$this->curYear = $entry['curYear'];
		$this->curStarts = $entry['curStarts'];
		$this->curWins = $entry['curWins'];
		$this->curPlaces = $entry['curPlaces'];
		$this->curShows = $entry['curShows'];
		$this->curEarnings = $entry['curEarnings'];
		$this->prevYear = $entry['prevYear'];
		$this->prevStarts = $entry['prevStarts'];
		$this->prevWins = $entry['prevWins'];
		$this->prevPlaces = $entry['prevPlaces'];
		$this->prevShows = $entry['prevShows'];
		$this->prevEarnings = $entry['prevEarnings'];
		$this->lifeStarts = $entry['lifeStarts'];
		$this->lifeWins = $entry['lifeWins'];
		$this->lifePlaces = $entry['lifePlaces'];
		$this->lifeShows = $entry['lifeShows'];
		$this->lifeEarnings = $entry['lifeEarnings'];
		$this->dateWorkout1 = $entry['dateWorkout1'];
		$this->dateWorkout2 = $entry['dateWorkout2'];
		$this->dateWorkout3 = $entry['dateWorkout3'];
		$this->dateWorkout4 = $entry['dateWorkout4'];
		$this->dateWorkout5 = $entry['dateWorkout5'];
		$this->dateWorkout6 = $entry['dateWorkout6'];
		$this->dateWorkout7 = $entry['dateWorkout7'];
		$this->dateWorkout8 = $entry['dateWorkout8'];
		$this->dateWorkout9 = $entry['dateWorkout9'];
		$this->dateWorkout10 = $entry['dateWorkout10'];
		$this->dateWorkout11 = $entry['dateWorkout11'];
		$this->dateWorkout12 = $entry['dateWorkout12'];
		$this->timeWorkout1 = $entry['timeWorkout1'];
		$this->timeWorkout2 = $entry['timeWorkout2'];
		$this->timeWorkout3 = $entry['timeWorkout3'];
		$this->timeWorkout4 = $entry['timeWorkout4'];
		$this->timeWorkout5 = $entry['timeWorkout5'];
		$this->timeWorkout6 = $entry['timeWorkout6'];
		$this->timeWorkout7 = $entry['timeWorkout7'];
		$this->timeWorkout8 = $entry['timeWorkout8'];
		$this->timeWorkout9 = $entry['timeWorkout9'];
		$this->timeWorkout10 = $entry['timeWorkout10'];
		$this->timeWorkout11 = $entry['timeWorkout11'];
		$this->timeWorkout12 = $entry['timeWorkout12'];
		$this->trackWorkout1 = $entry['trackWorkout1'];
		$this->trackWorkout2 = $entry['trackWorkout2'];
		$this->trackWorkout3 = $entry['trackWorkout3'];
		$this->trackWorkout4 = $entry['trackWorkout4'];
		$this->trackWorkout5 = $entry['trackWorkout5'];
		$this->trackWorkout6 = $entry['trackWorkout6'];
		$this->trackWorkout7 = $entry['trackWorkout7'];
		$this->trackWorkout8 = $entry['trackWorkout8'];
		$this->trackWorkout9 = $entry['trackWorkout9'];
		$this->trackWorkout10 = $entry['trackWorkout10'];
		$this->trackWorkout11 = $entry['trackWorkout11'];
		$this->trackWorkout12 = $entry['trackWorkout12'];
		$this->distanceWorkout1 = $entry['distanceWorkout1'];
		$this->distanceWorkout2 = $entry['distanceWorkout2'];
		$this->distanceWorkout3 = $entry['distanceWorkout3'];
		$this->distanceWorkout4 = $entry['distanceWorkout4'];
		$this->distanceWorkout5 = $entry['distanceWorkout5'];
		$this->distanceWorkout6 = $entry['distanceWorkout6'];
		$this->distanceWorkout7 = $entry['distanceWorkout7'];
		$this->distanceWorkout8 = $entry['distanceWorkout8'];
		$this->distanceWorkout9 = $entry['distanceWorkout9'];
		$this->distanceWorkout10 = $entry['distanceWorkout10'];
		$this->distanceWorkout11 = $entry['distanceWorkout11'];
		$this->distanceWorkout12 = $entry['distanceWorkout12'];
		$this->conditionWorkout1 = $entry['conditionWorkout1'];
		$this->conditionWorkout2 = $entry['conditionWorkout2'];
		$this->conditionWorkout3 = $entry['conditionWorkout3'];
		$this->conditionWorkout4 = $entry['conditionWorkout4'];
		$this->conditionWorkout5 = $entry['conditionWorkout5'];
		$this->conditionWorkout6 = $entry['conditionWorkout6'];
		$this->conditionWorkout7 = $entry['conditionWorkout7'];
		$this->conditionWorkout8 = $entry['conditionWorkout8'];
		$this->conditionWorkout9 = $entry['conditionWorkout9'];
		$this->conditionWorkout10 = $entry['conditionWorkout10'];
		$this->conditionWorkout11 = $entry['conditionWorkout11'];
		$this->conditionWorkout12 = $entry['conditionWorkout12'];
		$this->describeWorkout1 = $entry['describeWorkout1'];
		$this->describeWorkout2 = $entry['describeWorkout2'];
		$this->describeWorkout3 = $entry['describeWorkout3'];
		$this->describeWorkout4 = $entry['describeWorkout4'];
		$this->describeWorkout5 = $entry['describeWorkout5'];
		$this->describeWorkout6 = $entry['describeWorkout6'];
		$this->describeWorkout7 = $entry['describeWorkout7'];
		$this->describeWorkout8 = $entry['describeWorkout8'];
		$this->describeWorkout9 = $entry['describeWorkout9'];
		$this->describeWorkout10 = $entry['describeWorkout10'];
		$this->describeWorkout11 = $entry['describeWorkout11'];
		$this->describeWorkout12 = $entry['describeWorkout12'];
		$this->innerIndicateWorkout1 = $entry['innerIndicateWorkout1'];
		$this->innerIndicateWorkout2 = $entry['innerIndicateWorkout2'];
		$this->innerIndicateWorkout3 = $entry['innerIndicateWorkout3'];
		$this->innerIndicateWorkout4 = $entry['innerIndicateWorkout4'];
		$this->innerIndicateWorkout5 = $entry['innerIndicateWorkout5'];
		$this->innerIndicateWorkout6 = $entry['innerIndicateWorkout6'];
		$this->innerIndicateWorkout7 = $entry['innerIndicateWorkout7'];
		$this->innerIndicateWorkout8 = $entry['innerIndicateWorkout8'];
		$this->innerIndicateWorkout9 = $entry['innerIndicateWorkout9'];
		$this->innerIndicateWorkout10 = $entry['innerIndicateWorkout10'];
		$this->innerIndicateWorkout11 = $entry['innerIndicateWorkout11'];
		$this->innerIndicateWorkout12 = $entry['innerIndicateWorkout12'];
		$this->numWorksWorkout1 = $entry['numWorksWorkout1'];
		$this->numWorksWorkout2 = $entry['numWorksWorkout2'];
		$this->numWorksWorkout3 = $entry['numWorksWorkout3'];
		$this->numWorksWorkout4 = $entry['numWorksWorkout4'];
		$this->numWorksWorkout5 = $entry['numWorksWorkout5'];
		$this->numWorksWorkout6 = $entry['numWorksWorkout6'];
		$this->numWorksWorkout7 = $entry['numWorksWorkout7'];
		$this->numWorksWorkout8 = $entry['numWorksWorkout8'];
		$this->numWorksWorkout9 = $entry['numWorksWorkout9'];
		$this->numWorksWorkout10 = $entry['numWorksWorkout10'];
		$this->numWorksWorkout11 = $entry['numWorksWorkout11'];
		$this->numWorksWorkout12 = $entry['numWorksWorkout12'];
		$this->rankWorkout1 = $entry['rankWorkout1'];
		$this->rankWorkout2 = $entry['rankWorkout2'];
		$this->rankWorkout3 = $entry['rankWorkout3'];
		$this->rankWorkout4 = $entry['rankWorkout4'];
		$this->rankWorkout5 = $entry['rankWorkout5'];
		$this->rankWorkout6 = $entry['rankWorkout6'];
		$this->rankWorkout7 = $entry['rankWorkout7'];
		$this->rankWorkout8 = $entry['rankWorkout8'];
		$this->rankWorkout9 = $entry['rankWorkout9'];
		$this->rankWorkout10 = $entry['rankWorkout10'];
		$this->rankWorkout11 = $entry['rankWorkout11'];
		$this->rankWorkout12 = $entry['rankWorkout12'];
		$this->BrisRunStyle = $entry['BrisRunStyle'];
		$this->Quirin = $entry['Quirin'];
		$this->daysSinceLastRace = $entry['daysSinceLastRace'];
		$this->BrisPrimePowerRating = $entry['BrisPrimePowerRating'];
		$this->ppRaceDate1 = $entry['ppRaceDate1'];
		$this->ppRaceDate2 = $entry['ppRaceDate2'];
		$this->ppRaceDate3 = $entry['ppRaceDate3'];
		$this->ppRaceDate4 = $entry['ppRaceDate4'];
		$this->ppRaceDate5 = $entry['ppRaceDate5'];
		$this->ppRaceDate6 = $entry['ppRaceDate6'];
		$this->ppRaceDate7 = $entry['ppRaceDate7'];
		$this->ppRaceDate8 = $entry['ppRaceDate8'];
		$this->ppRaceDate9 = $entry['ppRaceDate9'];
		$this->ppRaceDate10 = $entry['ppRaceDate10'];
		$this->ppDaysPrev1 = $entry['ppDaysPrev1'];
		$this->ppDaysPrev2 = $entry['ppDaysPrev2'];
		$this->ppDaysPrev3 = $entry['ppDaysPrev3'];
		$this->ppDaysPrev4 = $entry['ppDaysPrev4'];
		$this->ppDaysPrev5 = $entry['ppDaysPrev5'];
		$this->ppDaysPrev6 = $entry['ppDaysPrev6'];
		$this->ppDaysPrev7 = $entry['ppDaysPrev7'];
		$this->ppDaysPrev8 = $entry['ppDaysPrev8'];
		$this->ppDaysPrev9 = $entry['ppDaysPrev9'];
		$this->ppDaysPrev10 = $entry['ppDaysPrev10'];
		$this->ppTrackCode1 = $entry['ppTrackCode1'];
		$this->ppTrackCode2 = $entry['ppTrackCode2'];
		$this->ppTrackCode3 = $entry['ppTrackCode3'];
		$this->ppTrackCode4 = $entry['ppTrackCode4'];
		$this->ppTrackCode5 = $entry['ppTrackCode5'];
		$this->ppTrackCode6 = $entry['ppTrackCode6'];
		$this->ppTrackCode7 = $entry['ppTrackCode7'];
		$this->ppTrackCode8 = $entry['ppTrackCode8'];
		$this->ppTrackCode9 = $entry['ppTrackCode9'];
		$this->ppTrackCode10 = $entry['ppTrackCode10'];
		$this->ppBrisTrackCode1 = $entry['ppBrisTrackCode1'];
		$this->ppBrisTrackCode2 = $entry['ppBrisTrackCode2'];
		$this->ppBrisTrackCode3 = $entry['ppBrisTrackCode3'];
		$this->ppBrisTrackCode4 = $entry['ppBrisTrackCode4'];
		$this->ppBrisTrackCode5 = $entry['ppBrisTrackCode5'];
		$this->ppBrisTrackCode6 = $entry['ppBrisTrackCode6'];
		$this->ppBrisTrackCode7 = $entry['ppBrisTrackCode7'];
		$this->ppBrisTrackCode8 = $entry['ppBrisTrackCode8'];
		$this->ppBrisTrackCode9 = $entry['ppBrisTrackCode9'];
		$this->ppBrisTrackCode10 = $entry['ppBrisTrackCode10'];
		$this->ppRaceNum1 = $entry['ppRaceNum1'];
		$this->ppRaceNum2 = $entry['ppRaceNum2'];
		$this->ppRaceNum3 = $entry['ppRaceNum3'];
		$this->ppRaceNum4 = $entry['ppRaceNum4'];
		$this->ppRaceNum5 = $entry['ppRaceNum5'];
		$this->ppRaceNum6 = $entry['ppRaceNum6'];
		$this->ppRaceNum7 = $entry['ppRaceNum7'];
		$this->ppRaceNum8 = $entry['ppRaceNum8'];
		$this->ppRaceNum9 = $entry['ppRaceNum9'];
		$this->ppRaceNum10 = $entry['ppRaceNum10'];
		$this->ppTrackCond1 = $entry['ppTrackCond1'];
		$this->ppTrackCond2 = $entry['ppTrackCond2'];
		$this->ppTrackCond3 = $entry['ppTrackCond3'];
		$this->ppTrackCond4 = $entry['ppTrackCond4'];
		$this->ppTrackCond5 = $entry['ppTrackCond5'];
		$this->ppTrackCond6 = $entry['ppTrackCond6'];
		$this->ppTrackCond7 = $entry['ppTrackCond7'];
		$this->ppTrackCond8 = $entry['ppTrackCond8'];
		$this->ppTrackCond9 = $entry['ppTrackCond9'];
		$this->ppTrackCond10 = $entry['ppTrackCond10'];
		$this->ppDistanceYards1 = $entry['ppDistanceYards1'];
		$this->ppDistanceYards2 = $entry['ppDistanceYards2'];
		$this->ppDistanceYards3 = $entry['ppDistanceYards3'];
		$this->ppDistanceYards4 = $entry['ppDistanceYards4'];
		$this->ppDistanceYards5 = $entry['ppDistanceYards5'];
		$this->ppDistanceYards6 = $entry['ppDistanceYards6'];
		$this->ppDistanceYards7 = $entry['ppDistanceYards7'];
		$this->ppDistanceYards8 = $entry['ppDistanceYards8'];
		$this->ppDistanceYards9 = $entry['ppDistanceYards9'];
		$this->ppDistanceYards10 = $entry['ppDistanceYards10'];
		$this->ppSurface1 = $entry['ppSurface1'];
		$this->ppSurface2 = $entry['ppSurface2'];
		$this->ppSurface3 = $entry['ppSurface3'];
		$this->ppSurface4 = $entry['ppSurface4'];
		$this->ppSurface5 = $entry['ppSurface5'];
		$this->ppSurface6 = $entry['ppSurface6'];
		$this->ppSurface7 = $entry['ppSurface7'];
		$this->ppSurface8 = $entry['ppSurface8'];
		$this->ppSurface9 = $entry['ppSurface9'];
		$this->ppSurface10 = $entry['ppSurface10'];
		$this->ppSpecialChute1 = $entry['ppSpecialChute1'];
		$this->ppSpecialChute2 = $entry['ppSpecialChute2'];
		$this->ppSpecialChute3 = $entry['ppSpecialChute3'];
		$this->ppSpecialChute4 = $entry['ppSpecialChute4'];
		$this->ppSpecialChute5 = $entry['ppSpecialChute5'];
		$this->ppSpecialChute6 = $entry['ppSpecialChute6'];
		$this->ppSpecialChute7 = $entry['ppSpecialChute7'];
		$this->ppSpecialChute8 = $entry['ppSpecialChute8'];
		$this->ppSpecialChute9 = $entry['ppSpecialChute9'];
		$this->ppSpecialChute10 = $entry['ppSpecialChute10'];
		$this->ppNumEntrants1 = $entry['ppNumEntrants1'];
		$this->ppNumEntrants2 = $entry['ppNumEntrants2'];
		$this->ppNumEntrants3 = $entry['ppNumEntrants3'];
		$this->ppNumEntrants4 = $entry['ppNumEntrants4'];
		$this->ppNumEntrants5 = $entry['ppNumEntrants5'];
		$this->ppNumEntrants6 = $entry['ppNumEntrants6'];
		$this->ppNumEntrants7 = $entry['ppNumEntrants7'];
		$this->ppNumEntrants8 = $entry['ppNumEntrants8'];
		$this->ppNumEntrants9 = $entry['ppNumEntrants9'];
		$this->ppNumEntrants10 = $entry['ppNumEntrants10'];
		$this->ppPostPosition1 = $entry['ppPostPosition1'];
		$this->ppPostPosition2 = $entry['ppPostPosition2'];
		$this->ppPostPosition3 = $entry['ppPostPosition3'];
		$this->ppPostPosition4 = $entry['ppPostPosition4'];
		$this->ppPostPosition5 = $entry['ppPostPosition5'];
		$this->ppPostPosition6 = $entry['ppPostPosition6'];
		$this->ppPostPosition7 = $entry['ppPostPosition7'];
		$this->ppPostPosition8 = $entry['ppPostPosition8'];
		$this->ppPostPosition9 = $entry['ppPostPosition9'];
		$this->ppPostPosition10 = $entry['ppPostPosition10'];
		$this->ppEquipment1 = $entry['ppEquipment1'];
		$this->ppEquipment2 = $entry['ppEquipment2'];
		$this->ppEquipment3 = $entry['ppEquipment3'];
		$this->ppEquipment4 = $entry['ppEquipment4'];
		$this->ppEquipment5 = $entry['ppEquipment5'];
		$this->ppEquipment6 = $entry['ppEquipment6'];
		$this->ppEquipment7 = $entry['ppEquipment7'];
		$this->ppEquipment8 = $entry['ppEquipment8'];
		$this->ppEquipment9 = $entry['ppEquipment9'];
		$this->ppEquipment10 = $entry['ppEquipment10'];
		$this->ppMeds1 = $entry['ppMeds1'];
		$this->ppMeds2 = $entry['ppMeds2'];
		$this->ppMeds3 = $entry['ppMeds3'];
		$this->ppMeds4 = $entry['ppMeds4'];
		$this->ppMeds5 = $entry['ppMeds5'];
		$this->ppMeds6 = $entry['ppMeds6'];
		$this->ppMeds7 = $entry['ppMeds7'];
		$this->ppMeds8 = $entry['ppMeds8'];
		$this->ppMeds9 = $entry['ppMeds9'];
		$this->ppMeds10 = $entry['ppMeds10'];
		$this->ppTripComment1 = $entry['ppTripComment1'];
		$this->ppTripComment2 = $entry['ppTripComment2'];
		$this->ppTripComment3 = $entry['ppTripComment3'];
		$this->ppTripComment4 = $entry['ppTripComment4'];
		$this->ppTripComment5 = $entry['ppTripComment5'];
		$this->ppTripComment6 = $entry['ppTripComment6'];
		$this->ppTripComment7 = $entry['ppTripComment7'];
		$this->ppTripComment8 = $entry['ppTripComment8'];
		$this->ppTripComment9 = $entry['ppTripComment9'];
		$this->ppTripComment10 = $entry['ppTripComment10'];
		$this->ppWinnersName1 = $entry['ppWinnersName1'];
		$this->ppWinnersName2 = $entry['ppWinnersName2'];
		$this->ppWinnersName3 = $entry['ppWinnersName3'];
		$this->ppWinnersName4 = $entry['ppWinnersName4'];
		$this->ppWinnersName5 = $entry['ppWinnersName5'];
		$this->ppWinnersName6 = $entry['ppWinnersName6'];
		$this->ppWinnersName7 = $entry['ppWinnersName7'];
		$this->ppWinnersName8 = $entry['ppWinnersName8'];
		$this->ppWinnersName9 = $entry['ppWinnersName9'];
		$this->ppWinnersName10 = $entry['ppWinnersName10'];
		$this->pp2ndPlaceName1 = $entry['pp2ndPlaceName1'];
		$this->pp2ndPlaceName2 = $entry['pp2ndPlaceName2'];
		$this->pp2ndPlaceName3 = $entry['pp2ndPlaceName3'];
		$this->pp2ndPlaceName4 = $entry['pp2ndPlaceName4'];
		$this->pp2ndPlaceName5 = $entry['pp2ndPlaceName5'];
		$this->pp2ndPlaceName6 = $entry['pp2ndPlaceName6'];
		$this->pp2ndPlaceName7 = $entry['pp2ndPlaceName7'];
		$this->pp2ndPlaceName8 = $entry['pp2ndPlaceName8'];
		$this->pp2ndPlaceName9 = $entry['pp2ndPlaceName9'];
		$this->pp2ndPlaceName10 = $entry['pp2ndPlaceName10'];
		$this->pp3rdPlaceName1 = $entry['pp3rdPlaceName1'];
		$this->pp3rdPlaceName2 = $entry['pp3rdPlaceName2'];
		$this->pp3rdPlaceName3 = $entry['pp3rdPlaceName3'];
		$this->pp3rdPlaceName4 = $entry['pp3rdPlaceName4'];
		$this->pp3rdPlaceName5 = $entry['pp3rdPlaceName5'];
		$this->pp3rdPlaceName6 = $entry['pp3rdPlaceName6'];
		$this->pp3rdPlaceName7 = $entry['pp3rdPlaceName7'];
		$this->pp3rdPlaceName8 = $entry['pp3rdPlaceName8'];
		$this->pp3rdPlaceName9 = $entry['pp3rdPlaceName9'];
		$this->pp3rdPlaceName10 = $entry['pp3rdPlaceName10'];
		$this->ppWinnersWeight1 = $entry['ppWinnersWeight1'];
		$this->ppWinnersWeight2 = $entry['ppWinnersWeight2'];
		$this->ppWinnersWeight3 = $entry['ppWinnersWeight3'];
		$this->ppWinnersWeight4 = $entry['ppWinnersWeight4'];
		$this->ppWinnersWeight5 = $entry['ppWinnersWeight5'];
		$this->ppWinnersWeight6 = $entry['ppWinnersWeight6'];
		$this->ppWinnersWeight7 = $entry['ppWinnersWeight7'];
		$this->ppWinnersWeight8 = $entry['ppWinnersWeight8'];
		$this->ppWinnersWeight9 = $entry['ppWinnersWeight9'];
		$this->ppWinnersWeight10 = $entry['ppWinnersWeight10'];
		$this->pp2ndPlaceWeight1 = $entry['pp2ndPlaceWeight1'];
		$this->pp2ndPlaceWeight2 = $entry['pp2ndPlaceWeight2'];
		$this->pp2ndPlaceWeight3 = $entry['pp2ndPlaceWeight3'];
		$this->pp2ndPlaceWeight4 = $entry['pp2ndPlaceWeight4'];
		$this->pp2ndPlaceWeight5 = $entry['pp2ndPlaceWeight5'];
		$this->pp2ndPlaceWeight6 = $entry['pp2ndPlaceWeight6'];
		$this->pp2ndPlaceWeight7 = $entry['pp2ndPlaceWeight7'];
		$this->pp2ndPlaceWeight8 = $entry['pp2ndPlaceWeight8'];
		$this->pp2ndPlaceWeight9 = $entry['pp2ndPlaceWeight9'];
		$this->pp2ndPlaceWeight10 = $entry['pp2ndPlaceWeight10'];
		$this->pp3rdPlaceWeight1 = $entry['pp3rdPlaceWeight1'];
		$this->pp3rdPlaceWeight2 = $entry['pp3rdPlaceWeight2'];
		$this->pp3rdPlaceWeight3 = $entry['pp3rdPlaceWeight3'];
		$this->pp3rdPlaceWeight4 = $entry['pp3rdPlaceWeight4'];
		$this->pp3rdPlaceWeight5 = $entry['pp3rdPlaceWeight5'];
		$this->pp3rdPlaceWeight6 = $entry['pp3rdPlaceWeight6'];
		$this->pp3rdPlaceWeight7 = $entry['pp3rdPlaceWeight7'];
		$this->pp3rdPlaceWeight8 = $entry['pp3rdPlaceWeight8'];
		$this->pp3rdPlaceWeight9 = $entry['pp3rdPlaceWeight9'];
		$this->pp3rdPlaceWeight10 = $entry['pp3rdPlaceWeight10'];
		$this->ppWinnersMargin1 = $entry['ppWinnersMargin1'];
		$this->ppWinnersMargin2 = $entry['ppWinnersMargin2'];
		$this->ppWinnersMargin3 = $entry['ppWinnersMargin3'];
		$this->ppWinnersMargin4 = $entry['ppWinnersMargin4'];
		$this->ppWinnersMargin5 = $entry['ppWinnersMargin5'];
		$this->ppWinnersMargin6 = $entry['ppWinnersMargin6'];
		$this->ppWinnersMargin7 = $entry['ppWinnersMargin7'];
		$this->ppWinnersMargin8 = $entry['ppWinnersMargin8'];
		$this->ppWinnersMargin9 = $entry['ppWinnersMargin9'];
		$this->ppWinnersMargin10 = $entry['ppWinnersMargin10'];
		$this->pp2ndPlaceMargin1 = $entry['pp2ndPlaceMargin1'];
		$this->pp2ndPlaceMargin2 = $entry['pp2ndPlaceMargin2'];
		$this->pp2ndPlaceMargin3 = $entry['pp2ndPlaceMargin3'];
		$this->pp2ndPlaceMargin4 = $entry['pp2ndPlaceMargin4'];
		$this->pp2ndPlaceMargin5 = $entry['pp2ndPlaceMargin5'];
		$this->pp2ndPlaceMargin6 = $entry['pp2ndPlaceMargin6'];
		$this->pp2ndPlaceMargin7 = $entry['pp2ndPlaceMargin7'];
		$this->pp2ndPlaceMargin8 = $entry['pp2ndPlaceMargin8'];
		$this->pp2ndPlaceMargin9 = $entry['pp2ndPlaceMargin9'];
		$this->pp2ndPlaceMargin10 = $entry['pp2ndPlaceMargin10'];
		$this->pp3rdPlaceMargin1 = $entry['pp3rdPlaceMargin1'];
		$this->pp3rdPlaceMargin2 = $entry['pp3rdPlaceMargin2'];
		$this->pp3rdPlaceMargin3 = $entry['pp3rdPlaceMargin3'];
		$this->pp3rdPlaceMargin4 = $entry['pp3rdPlaceMargin4'];
		$this->pp3rdPlaceMargin5 = $entry['pp3rdPlaceMargin5'];
		$this->pp3rdPlaceMargin6 = $entry['pp3rdPlaceMargin6'];
		$this->pp3rdPlaceMargin7 = $entry['pp3rdPlaceMargin7'];
		$this->pp3rdPlaceMargin8 = $entry['pp3rdPlaceMargin8'];
		$this->pp3rdPlaceMargin9 = $entry['pp3rdPlaceMargin9'];
		$this->pp3rdPlaceMargin10 = $entry['pp3rdPlaceMargin10'];
		$this->ppExtraComment1 = $entry['ppExtraComment1'];
		$this->ppExtraComment2 = $entry['ppExtraComment2'];
		$this->ppExtraComment3 = $entry['ppExtraComment3'];
		$this->ppExtraComment4 = $entry['ppExtraComment4'];
		$this->ppExtraComment5 = $entry['ppExtraComment5'];
		$this->ppExtraComment6 = $entry['ppExtraComment6'];
		$this->ppExtraComment7 = $entry['ppExtraComment7'];
		$this->ppExtraComment8 = $entry['ppExtraComment8'];
		$this->ppExtraComment9 = $entry['ppExtraComment9'];
		$this->ppExtraComment10 = $entry['ppExtraComment10'];
		$this->ppWeight1 = $entry['ppWeight1'];
		$this->ppWeight2 = $entry['ppWeight2'];
		$this->ppWeight3 = $entry['ppWeight3'];
		$this->ppWeight4 = $entry['ppWeight4'];
		$this->ppWeight5 = $entry['ppWeight5'];
		$this->ppWeight6 = $entry['ppWeight6'];
		$this->ppWeight7 = $entry['ppWeight7'];
		$this->ppWeight8 = $entry['ppWeight8'];
		$this->ppWeight9 = $entry['ppWeight9'];
		$this->ppWeight10 = $entry['ppWeight10'];
		$this->ppOdds1 = $entry['ppOdds1'];
		$this->ppOdds2 = $entry['ppOdds2'];
		$this->ppOdds3 = $entry['ppOdds3'];
		$this->ppOdds4 = $entry['ppOdds4'];
		$this->ppOdds5 = $entry['ppOdds5'];
		$this->ppOdds6 = $entry['ppOdds6'];
		$this->ppOdds7 = $entry['ppOdds7'];
		$this->ppOdds8 = $entry['ppOdds8'];
		$this->ppOdds9 = $entry['ppOdds9'];
		$this->ppOdds10 = $entry['ppOdds10'];
		$this->ppEntry1 = $entry['ppEntry1'];
		$this->ppEntry2 = $entry['ppEntry2'];
		$this->ppEntry3 = $entry['ppEntry3'];
		$this->ppEntry4 = $entry['ppEntry4'];
		$this->ppEntry5 = $entry['ppEntry5'];
		$this->ppEntry6 = $entry['ppEntry6'];
		$this->ppEntry7 = $entry['ppEntry7'];
		$this->ppEntry8 = $entry['ppEntry8'];
		$this->ppEntry9 = $entry['ppEntry9'];
		$this->ppEntry10 = $entry['ppEntry10'];
		$this->ppRaceClassification1 = $entry['ppRaceClassification1'];
		$this->ppRaceClassification2 = $entry['ppRaceClassification2'];
		$this->ppRaceClassification3 = $entry['ppRaceClassification3'];
		$this->ppRaceClassification4 = $entry['ppRaceClassification4'];
		$this->ppRaceClassification5 = $entry['ppRaceClassification5'];
		$this->ppRaceClassification6 = $entry['ppRaceClassification6'];
		$this->ppRaceClassification7 = $entry['ppRaceClassification7'];
		$this->ppRaceClassification8 = $entry['ppRaceClassification8'];
		$this->ppRaceClassification9 = $entry['ppRaceClassification9'];
		$this->ppRaceClassification10 = $entry['ppRaceClassification10'];
		$this->ppClaimingPriceHorse1 = $entry['ppClaimingPriceHorse1'];
		$this->ppClaimingPriceHorse2 = $entry['ppClaimingPriceHorse2'];
		$this->ppClaimingPriceHorse3 = $entry['ppClaimingPriceHorse3'];
		$this->ppClaimingPriceHorse4 = $entry['ppClaimingPriceHorse4'];
		$this->ppClaimingPriceHorse5 = $entry['ppClaimingPriceHorse5'];
		$this->ppClaimingPriceHorse6 = $entry['ppClaimingPriceHorse6'];
		$this->ppClaimingPriceHorse7 = $entry['ppClaimingPriceHorse7'];
		$this->ppClaimingPriceHorse8 = $entry['ppClaimingPriceHorse8'];
		$this->ppClaimingPriceHorse9 = $entry['ppClaimingPriceHorse9'];
		$this->ppClaimingPriceHorse10 = $entry['ppClaimingPriceHorse10'];
		$this->ppPurse1 = $entry['ppPurse1'];
		$this->ppPurse2 = $entry['ppPurse2'];
		$this->ppPurse3 = $entry['ppPurse3'];
		$this->ppPurse4 = $entry['ppPurse4'];
		$this->ppPurse5 = $entry['ppPurse5'];
		$this->ppPurse6 = $entry['ppPurse6'];
		$this->ppPurse7 = $entry['ppPurse7'];
		$this->ppPurse8 = $entry['ppPurse8'];
		$this->ppPurse9 = $entry['ppPurse9'];
		$this->ppPurse10 = $entry['ppPurse10'];
		$this->ppStartingCallPos1 = $entry['ppStartingCallPos1'];
		$this->ppStartingCallPos2 = $entry['ppStartingCallPos2'];
		$this->ppStartingCallPos3 = $entry['ppStartingCallPos3'];
		$this->ppStartingCallPos4 = $entry['ppStartingCallPos4'];
		$this->ppStartingCallPos5 = $entry['ppStartingCallPos5'];
		$this->ppStartingCallPos6 = $entry['ppStartingCallPos6'];
		$this->ppStartingCallPos7 = $entry['ppStartingCallPos7'];
		$this->ppStartingCallPos8 = $entry['ppStartingCallPos8'];
		$this->ppStartingCallPos9 = $entry['ppStartingCallPos9'];
		$this->ppStartingCallPos10 = $entry['ppStartingCallPos10'];
		$this->ppFirstCallPos1 = $entry['ppFirstCallPos1'];
		$this->ppFirstCallPos2 = $entry['ppFirstCallPos2'];
		$this->ppFirstCallPos3 = $entry['ppFirstCallPos3'];
		$this->ppFirstCallPos4 = $entry['ppFirstCallPos4'];
		$this->ppFirstCallPos5 = $entry['ppFirstCallPos5'];
		$this->ppFirstCallPos6 = $entry['ppFirstCallPos6'];
		$this->ppFirstCallPos7 = $entry['ppFirstCallPos7'];
		$this->ppFirstCallPos8 = $entry['ppFirstCallPos8'];
		$this->ppFirstCallPos9 = $entry['ppFirstCallPos9'];
		$this->ppFirstCallPos10 = $entry['ppFirstCallPos10'];
		$this->ppSecondCallPos1 = $entry['ppSecondCallPos1'];
		$this->ppSecondCallPos2 = $entry['ppSecondCallPos2'];
		$this->ppSecondCallPos3 = $entry['ppSecondCallPos3'];
		$this->ppSecondCallPos4 = $entry['ppSecondCallPos4'];
		$this->ppSecondCallPos5 = $entry['ppSecondCallPos5'];
		$this->ppSecondCallPos6 = $entry['ppSecondCallPos6'];
		$this->ppSecondCallPos7 = $entry['ppSecondCallPos7'];
		$this->ppSecondCallPos8 = $entry['ppSecondCallPos8'];
		$this->ppSecondCallPos9 = $entry['ppSecondCallPos9'];
		$this->ppSecondCallPos10 = $entry['ppSecondCallPos10'];
		$this->ppStretchPos1 = $entry['ppStretchPos1'];
		$this->ppStretchPos2 = $entry['ppStretchPos2'];
		$this->ppStretchPos3 = $entry['ppStretchPos3'];
		$this->ppStretchPos4 = $entry['ppStretchPos4'];
		$this->ppStretchPos5 = $entry['ppStretchPos5'];
		$this->ppStretchPos6 = $entry['ppStretchPos6'];
		$this->ppStretchPos7 = $entry['ppStretchPos7'];
		$this->ppStretchPos8 = $entry['ppStretchPos8'];
		$this->ppStretchPos9 = $entry['ppStretchPos9'];
		$this->ppStretchPos10 = $entry['ppStretchPos10'];
		$this->ppFinishPos1 = $entry['ppFinishPos1'];
		$this->ppFinishPos2 = $entry['ppFinishPos2'];
		$this->ppFinishPos3 = $entry['ppFinishPos3'];
		$this->ppFinishPos4 = $entry['ppFinishPos4'];
		$this->ppFinishPos5 = $entry['ppFinishPos5'];
		$this->ppFinishPos6 = $entry['ppFinishPos6'];
		$this->ppFinishPos7 = $entry['ppFinishPos7'];
		$this->ppFinishPos8 = $entry['ppFinishPos8'];
		$this->ppFinishPos9 = $entry['ppFinishPos9'];
		$this->ppFinishPos10 = $entry['ppFinishPos10'];
		$this->ppMoneyPos1 = $entry['ppMoneyPos1'];
		$this->ppMoneyPos2 = $entry['ppMoneyPos2'];
		$this->ppMoneyPos3 = $entry['ppMoneyPos3'];
		$this->ppMoneyPos4 = $entry['ppMoneyPos4'];
		$this->ppMoneyPos5 = $entry['ppMoneyPos5'];
		$this->ppMoneyPos6 = $entry['ppMoneyPos6'];
		$this->ppMoneyPos7 = $entry['ppMoneyPos7'];
		$this->ppMoneyPos8 = $entry['ppMoneyPos8'];
		$this->ppMoneyPos9 = $entry['ppMoneyPos9'];
		$this->ppMoneyPos10 = $entry['ppMoneyPos10'];
		$this->ppStartCallBeatenMargin1 = $entry['ppStartCallBeatenMargin1'];
		$this->ppStartCallBeatenMargin2 = $entry['ppStartCallBeatenMargin2'];
		$this->ppStartCallBeatenMargin3 = $entry['ppStartCallBeatenMargin3'];
		$this->ppStartCallBeatenMargin4 = $entry['ppStartCallBeatenMargin4'];
		$this->ppStartCallBeatenMargin5 = $entry['ppStartCallBeatenMargin5'];
		$this->ppStartCallBeatenMargin6 = $entry['ppStartCallBeatenMargin6'];
		$this->ppStartCallBeatenMargin7 = $entry['ppStartCallBeatenMargin7'];
		$this->ppStartCallBeatenMargin8 = $entry['ppStartCallBeatenMargin8'];
		$this->ppStartCallBeatenMargin9 = $entry['ppStartCallBeatenMargin9'];
		$this->ppStartCallBeatenMargin10 = $entry['ppStartCallBeatenMargin10'];
		$this->ppStartCallBeaten1 = $entry['ppStartCallBeaten1'];
		$this->ppStartCallBeaten2 = $entry['ppStartCallBeaten2'];
		$this->ppStartCallBeaten3 = $entry['ppStartCallBeaten3'];
		$this->ppStartCallBeaten4 = $entry['ppStartCallBeaten4'];
		$this->ppStartCallBeaten5 = $entry['ppStartCallBeaten5'];
		$this->ppStartCallBeaten6 = $entry['ppStartCallBeaten6'];
		$this->ppStartCallBeaten7 = $entry['ppStartCallBeaten7'];
		$this->ppStartCallBeaten8 = $entry['ppStartCallBeaten8'];
		$this->ppStartCallBeaten9 = $entry['ppStartCallBeaten9'];
		$this->ppStartCallBeaten10 = $entry['ppStartCallBeaten10'];
		$this->ppFirstCallBeatenMargin1 = $entry['ppFirstCallBeatenMargin1'];
		$this->ppFirstCallBeatenMargin2 = $entry['ppFirstCallBeatenMargin2'];
		$this->ppFirstCallBeatenMargin3 = $entry['ppFirstCallBeatenMargin3'];
		$this->ppFirstCallBeatenMargin4 = $entry['ppFirstCallBeatenMargin4'];
		$this->ppFirstCallBeatenMargin5 = $entry['ppFirstCallBeatenMargin5'];
		$this->ppFirstCallBeatenMargin6 = $entry['ppFirstCallBeatenMargin6'];
		$this->ppFirstCallBeatenMargin7 = $entry['ppFirstCallBeatenMargin7'];
		$this->ppFirstCallBeatenMargin8 = $entry['ppFirstCallBeatenMargin8'];
		$this->ppFirstCallBeatenMargin9 = $entry['ppFirstCallBeatenMargin9'];
		$this->ppFirstCallBeatenMargin10 = $entry['ppFirstCallBeatenMargin10'];
		$this->ppFirstCallBeaten1 = $entry['ppFirstCallBeaten1'];
		$this->ppFirstCallBeaten2 = $entry['ppFirstCallBeaten2'];
		$this->ppFirstCallBeaten3 = $entry['ppFirstCallBeaten3'];
		$this->ppFirstCallBeaten4 = $entry['ppFirstCallBeaten4'];
		$this->ppFirstCallBeaten5 = $entry['ppFirstCallBeaten5'];
		$this->ppFirstCallBeaten6 = $entry['ppFirstCallBeaten6'];
		$this->ppFirstCallBeaten7 = $entry['ppFirstCallBeaten7'];
		$this->ppFirstCallBeaten8 = $entry['ppFirstCallBeaten8'];
		$this->ppFirstCallBeaten9 = $entry['ppFirstCallBeaten9'];
		$this->ppFirstCallBeaten10 = $entry['ppFirstCallBeaten10'];
		$this->ppSecondCallBeatenMargin1 = $entry['ppSecondCallBeatenMargin1'];
		$this->ppSecondCallBeatenMargin2 = $entry['ppSecondCallBeatenMargin2'];
		$this->ppSecondCallBeatenMargin3 = $entry['ppSecondCallBeatenMargin3'];
		$this->ppSecondCallBeatenMargin4 = $entry['ppSecondCallBeatenMargin4'];
		$this->ppSecondCallBeatenMargin5 = $entry['ppSecondCallBeatenMargin5'];
		$this->ppSecondCallBeatenMargin6 = $entry['ppSecondCallBeatenMargin6'];
		$this->ppSecondCallBeatenMargin7 = $entry['ppSecondCallBeatenMargin7'];
		$this->ppSecondCallBeatenMargin8 = $entry['ppSecondCallBeatenMargin8'];
		$this->ppSecondCallBeatenMargin9 = $entry['ppSecondCallBeatenMargin9'];
		$this->ppSecondCallBeatenMargin10 = $entry['ppSecondCallBeatenMargin10'];
		$this->ppSecondCallBeaten1 = $entry['ppSecondCallBeaten1'];
		$this->ppSecondCallBeaten2 = $entry['ppSecondCallBeaten2'];
		$this->ppSecondCallBeaten3 = $entry['ppSecondCallBeaten3'];
		$this->ppSecondCallBeaten4 = $entry['ppSecondCallBeaten4'];
		$this->ppSecondCallBeaten5 = $entry['ppSecondCallBeaten5'];
		$this->ppSecondCallBeaten6 = $entry['ppSecondCallBeaten6'];
		$this->ppSecondCallBeaten7 = $entry['ppSecondCallBeaten7'];
		$this->ppSecondCallBeaten8 = $entry['ppSecondCallBeaten8'];
		$this->ppSecondCallBeaten9 = $entry['ppSecondCallBeaten9'];
		$this->ppSecondCallBeaten10 = $entry['ppSecondCallBeaten10'];
		$this->ppStretchBeatenMargin1 = $entry['ppStretchBeatenMargin1'];
		$this->ppStretchBeatenMargin2 = $entry['ppStretchBeatenMargin2'];
		$this->ppStretchBeatenMargin3 = $entry['ppStretchBeatenMargin3'];
		$this->ppStretchBeatenMargin4 = $entry['ppStretchBeatenMargin4'];
		$this->ppStretchBeatenMargin5 = $entry['ppStretchBeatenMargin5'];
		$this->ppStretchBeatenMargin6 = $entry['ppStretchBeatenMargin6'];
		$this->ppStretchBeatenMargin7 = $entry['ppStretchBeatenMargin7'];
		$this->ppStretchBeatenMargin8 = $entry['ppStretchBeatenMargin8'];
		$this->ppStretchBeatenMargin9 = $entry['ppStretchBeatenMargin9'];
		$this->ppStretchBeatenMargin10 = $entry['ppStretchBeatenMargin10'];
		$this->ppStretchBeaten1 = $entry['ppStretchBeaten1'];
		$this->ppStretchBeaten2 = $entry['ppStretchBeaten2'];
		$this->ppStretchBeaten3 = $entry['ppStretchBeaten3'];
		$this->ppStretchBeaten4 = $entry['ppStretchBeaten4'];
		$this->ppStretchBeaten5 = $entry['ppStretchBeaten5'];
		$this->ppStretchBeaten6 = $entry['ppStretchBeaten6'];
		$this->ppStretchBeaten7 = $entry['ppStretchBeaten7'];
		$this->ppStretchBeaten8 = $entry['ppStretchBeaten8'];
		$this->ppStretchBeaten9 = $entry['ppStretchBeaten9'];
		$this->ppStretchBeaten10 = $entry['ppStretchBeaten10'];
		$this->ppFinishBeatenMargin1 = $entry['ppFinishBeatenMargin1'];
		$this->ppFinishBeatenMargin2 = $entry['ppFinishBeatenMargin2'];
		$this->ppFinishBeatenMargin3 = $entry['ppFinishBeatenMargin3'];
		$this->ppFinishBeatenMargin4 = $entry['ppFinishBeatenMargin4'];
		$this->ppFinishBeatenMargin5 = $entry['ppFinishBeatenMargin5'];
		$this->ppFinishBeatenMargin6 = $entry['ppFinishBeatenMargin6'];
		$this->ppFinishBeatenMargin7 = $entry['ppFinishBeatenMargin7'];
		$this->ppFinishBeatenMargin8 = $entry['ppFinishBeatenMargin8'];
		$this->ppFinishBeatenMargin9 = $entry['ppFinishBeatenMargin9'];
		$this->ppFinishBeatenMargin10 = $entry['ppFinishBeatenMargin10'];
		$this->ppFinishBeaten1 = $entry['ppFinishBeaten1'];
		$this->ppFinishBeaten2 = $entry['ppFinishBeaten2'];
		$this->ppFinishBeaten3 = $entry['ppFinishBeaten3'];
		$this->ppFinishBeaten4 = $entry['ppFinishBeaten4'];
		$this->ppFinishBeaten5 = $entry['ppFinishBeaten5'];
		$this->ppFinishBeaten6 = $entry['ppFinishBeaten6'];
		$this->ppFinishBeaten7 = $entry['ppFinishBeaten7'];
		$this->ppFinishBeaten8 = $entry['ppFinishBeaten8'];
		$this->ppFinishBeaten9 = $entry['ppFinishBeaten9'];
		$this->ppFinishBeaten10 = $entry['ppFinishBeaten10'];
		$this->ppBris2fPaceRating1 = $entry['ppBris2fPaceRating1'];
		$this->ppBris2fPaceRating2 = $entry['ppBris2fPaceRating2'];
		$this->ppBris2fPaceRating3 = $entry['ppBris2fPaceRating3'];
		$this->ppBris2fPaceRating4 = $entry['ppBris2fPaceRating4'];
		$this->ppBris2fPaceRating5 = $entry['ppBris2fPaceRating5'];
		$this->ppBris2fPaceRating6 = $entry['ppBris2fPaceRating6'];
		$this->ppBris2fPaceRating7 = $entry['ppBris2fPaceRating7'];
		$this->ppBris2fPaceRating8 = $entry['ppBris2fPaceRating8'];
		$this->ppBris2fPaceRating9 = $entry['ppBris2fPaceRating9'];
		$this->ppBris2fPaceRating10 = $entry['ppBris2fPaceRating10'];
		$this->ppBris4fPaceRating1 = $entry['ppBris4fPaceRating1'];
		$this->ppBris4fPaceRating2 = $entry['ppBris4fPaceRating2'];
		$this->ppBris4fPaceRating3 = $entry['ppBris4fPaceRating3'];
		$this->ppBris4fPaceRating4 = $entry['ppBris4fPaceRating4'];
		$this->ppBris4fPaceRating5 = $entry['ppBris4fPaceRating5'];
		$this->ppBris4fPaceRating6 = $entry['ppBris4fPaceRating6'];
		$this->ppBris4fPaceRating7 = $entry['ppBris4fPaceRating7'];
		$this->ppBris4fPaceRating8 = $entry['ppBris4fPaceRating8'];
		$this->ppBris4fPaceRating9 = $entry['ppBris4fPaceRating9'];
		$this->ppBris4fPaceRating10 = $entry['ppBris4fPaceRating10'];
		$this->ppBris6fPaceRating1 = $entry['ppBris6fPaceRating1'];
		$this->ppBris6fPaceRating2 = $entry['ppBris6fPaceRating2'];
		$this->ppBris6fPaceRating3 = $entry['ppBris6fPaceRating3'];
		$this->ppBris6fPaceRating4 = $entry['ppBris6fPaceRating4'];
		$this->ppBris6fPaceRating5 = $entry['ppBris6fPaceRating5'];
		$this->ppBris6fPaceRating6 = $entry['ppBris6fPaceRating6'];
		$this->ppBris6fPaceRating7 = $entry['ppBris6fPaceRating7'];
		$this->ppBris6fPaceRating8 = $entry['ppBris6fPaceRating8'];
		$this->ppBris6fPaceRating9 = $entry['ppBris6fPaceRating9'];
		$this->ppBris6fPaceRating10 = $entry['ppBris6fPaceRating10'];
		$this->ppBris8fPaceRating1 = $entry['ppBris8fPaceRating1'];
		$this->ppBris8fPaceRating2 = $entry['ppBris8fPaceRating2'];
		$this->ppBris8fPaceRating3 = $entry['ppBris8fPaceRating3'];
		$this->ppBris8fPaceRating4 = $entry['ppBris8fPaceRating4'];
		$this->ppBris8fPaceRating5 = $entry['ppBris8fPaceRating5'];
		$this->ppBris8fPaceRating6 = $entry['ppBris8fPaceRating6'];
		$this->ppBris8fPaceRating7 = $entry['ppBris8fPaceRating7'];
		$this->ppBris8fPaceRating8 = $entry['ppBris8fPaceRating8'];
		$this->ppBris8fPaceRating9 = $entry['ppBris8fPaceRating9'];
		$this->ppBris8fPaceRating10 = $entry['ppBris8fPaceRating10'];
		$this->ppBris10fPaceRating1 = $entry['ppBris10fPaceRating1'];
		$this->ppBris10fPaceRating2 = $entry['ppBris10fPaceRating2'];
		$this->ppBris10fPaceRating3 = $entry['ppBris10fPaceRating3'];
		$this->ppBris10fPaceRating4 = $entry['ppBris10fPaceRating4'];
		$this->ppBris10fPaceRating5 = $entry['ppBris10fPaceRating5'];
		$this->ppBris10fPaceRating6 = $entry['ppBris10fPaceRating6'];
		$this->ppBris10fPaceRating7 = $entry['ppBris10fPaceRating7'];
		$this->ppBris10fPaceRating8 = $entry['ppBris10fPaceRating8'];
		$this->ppBris10fPaceRating9 = $entry['ppBris10fPaceRating9'];
		$this->ppBris10fPaceRating10 = $entry['ppBris10fPaceRating10'];
		$this->ppBrisLatePaceRating1 = $entry['ppBrisLatePaceRating1'];
		$this->ppBrisLatePaceRating2 = $entry['ppBrisLatePaceRating2'];
		$this->ppBrisLatePaceRating3 = $entry['ppBrisLatePaceRating3'];
		$this->ppBrisLatePaceRating4 = $entry['ppBrisLatePaceRating4'];
		$this->ppBrisLatePaceRating5 = $entry['ppBrisLatePaceRating5'];
		$this->ppBrisLatePaceRating6 = $entry['ppBrisLatePaceRating6'];
		$this->ppBrisLatePaceRating7 = $entry['ppBrisLatePaceRating7'];
		$this->ppBrisLatePaceRating8 = $entry['ppBrisLatePaceRating8'];
		$this->ppBrisLatePaceRating9 = $entry['ppBrisLatePaceRating9'];
		$this->ppBrisLatePaceRating10 = $entry['ppBrisLatePaceRating10'];
		$this->ppBrisSpeedRating1 = $entry['ppBrisSpeedRating1'];
		$this->ppBrisSpeedRating2 = $entry['ppBrisSpeedRating2'];
		$this->ppBrisSpeedRating3 = $entry['ppBrisSpeedRating3'];
		$this->ppBrisSpeedRating4 = $entry['ppBrisSpeedRating4'];
		$this->ppBrisSpeedRating5 = $entry['ppBrisSpeedRating5'];
		$this->ppBrisSpeedRating6 = $entry['ppBrisSpeedRating6'];
		$this->ppBrisSpeedRating7 = $entry['ppBrisSpeedRating7'];
		$this->ppBrisSpeedRating8 = $entry['ppBrisSpeedRating8'];
		$this->ppBrisSpeedRating9 = $entry['ppBrisSpeedRating9'];
		$this->ppBrisSpeedRating10 = $entry['ppBrisSpeedRating10'];
		$this->ppDRFSpeedRating1 = $entry['ppDRFSpeedRating1'];
		$this->ppDRFSpeedRating2 = $entry['ppDRFSpeedRating2'];
		$this->ppDRFSpeedRating3 = $entry['ppDRFSpeedRating3'];
		$this->ppDRFSpeedRating4 = $entry['ppDRFSpeedRating4'];
		$this->ppDRFSpeedRating5 = $entry['ppDRFSpeedRating5'];
		$this->ppDRFSpeedRating6 = $entry['ppDRFSpeedRating6'];
		$this->ppDRFSpeedRating7 = $entry['ppDRFSpeedRating7'];
		$this->ppDRFSpeedRating8 = $entry['ppDRFSpeedRating8'];
		$this->ppDRFSpeedRating9 = $entry['ppDRFSpeedRating9'];
		$this->ppDRFSpeedRating10 = $entry['ppDRFSpeedRating10'];
		$this->ppDRFTrackVariant1 = $entry['ppDRFTrackVariant1'];
		$this->ppDRFTrackVariant2 = $entry['ppDRFTrackVariant2'];
		$this->ppDRFTrackVariant3 = $entry['ppDRFTrackVariant3'];
		$this->ppDRFTrackVariant4 = $entry['ppDRFTrackVariant4'];
		$this->ppDRFTrackVariant5 = $entry['ppDRFTrackVariant5'];
		$this->ppDRFTrackVariant6 = $entry['ppDRFTrackVariant6'];
		$this->ppDRFTrackVariant7 = $entry['ppDRFTrackVariant7'];
		$this->ppDRFTrackVariant8 = $entry['ppDRFTrackVariant8'];
		$this->ppDRFTrackVariant9 = $entry['ppDRFTrackVariant9'];
		$this->ppDRFTrackVariant10 = $entry['ppDRFTrackVariant10'];
		$this->pp2fFraction1 = $entry['pp2fFraction1'];
		$this->pp2fFraction2 = $entry['pp2fFraction2'];
		$this->pp2fFraction3 = $entry['pp2fFraction3'];
		$this->pp2fFraction4 = $entry['pp2fFraction4'];
		$this->pp2fFraction5 = $entry['pp2fFraction5'];
		$this->pp2fFraction6 = $entry['pp2fFraction6'];
		$this->pp2fFraction7 = $entry['pp2fFraction7'];
		$this->pp2fFraction8 = $entry['pp2fFraction8'];
		$this->pp2fFraction9 = $entry['pp2fFraction9'];
		$this->pp2fFraction10 = $entry['pp2fFraction10'];
		$this->pp3fFraction1 = $entry['pp3fFraction1'];
		$this->pp3fFraction2 = $entry['pp3fFraction2'];
		$this->pp3fFraction3 = $entry['pp3fFraction3'];
		$this->pp3fFraction4 = $entry['pp3fFraction4'];
		$this->pp3fFraction5 = $entry['pp3fFraction5'];
		$this->pp3fFraction6 = $entry['pp3fFraction6'];
		$this->pp3fFraction7 = $entry['pp3fFraction7'];
		$this->pp3fFraction8 = $entry['pp3fFraction8'];
		$this->pp3fFraction9 = $entry['pp3fFraction9'];
		$this->pp3fFraction10 = $entry['pp3fFraction10'];
		$this->pp4fFraction1 = $entry['pp4fFraction1'];
		$this->pp4fFraction2 = $entry['pp4fFraction2'];
		$this->pp4fFraction3 = $entry['pp4fFraction3'];
		$this->pp4fFraction4 = $entry['pp4fFraction4'];
		$this->pp4fFraction5 = $entry['pp4fFraction5'];
		$this->pp4fFraction6 = $entry['pp4fFraction6'];
		$this->pp4fFraction7 = $entry['pp4fFraction7'];
		$this->pp4fFraction8 = $entry['pp4fFraction8'];
		$this->pp4fFraction9 = $entry['pp4fFraction9'];
		$this->pp4fFraction10 = $entry['pp4fFraction10'];
		$this->pp5fFraction1 = $entry['pp5fFraction1'];
		$this->pp5fFraction2 = $entry['pp5fFraction2'];
		$this->pp5fFraction3 = $entry['pp5fFraction3'];
		$this->pp5fFraction4 = $entry['pp5fFraction4'];
		$this->pp5fFraction5 = $entry['pp5fFraction5'];
		$this->pp5fFraction6 = $entry['pp5fFraction6'];
		$this->pp5fFraction7 = $entry['pp5fFraction7'];
		$this->pp5fFraction8 = $entry['pp5fFraction8'];
		$this->pp5fFraction9 = $entry['pp5fFraction9'];
		$this->pp5fFraction10 = $entry['pp5fFraction10'];
		$this->pp6fFraction1 = $entry['pp6fFraction1'];
		$this->pp6fFraction2 = $entry['pp6fFraction2'];
		$this->pp6fFraction3 = $entry['pp6fFraction3'];
		$this->pp6fFraction4 = $entry['pp6fFraction4'];
		$this->pp6fFraction5 = $entry['pp6fFraction5'];
		$this->pp6fFraction6 = $entry['pp6fFraction6'];
		$this->pp6fFraction7 = $entry['pp6fFraction7'];
		$this->pp6fFraction8 = $entry['pp6fFraction8'];
		$this->pp6fFraction9 = $entry['pp6fFraction9'];
		$this->pp6fFraction10 = $entry['pp6fFraction10'];
		$this->pp7fFraction1 = $entry['pp7fFraction1'];
		$this->pp7fFraction2 = $entry['pp7fFraction2'];
		$this->pp7fFraction3 = $entry['pp7fFraction3'];
		$this->pp7fFraction4 = $entry['pp7fFraction4'];
		$this->pp7fFraction5 = $entry['pp7fFraction5'];
		$this->pp7fFraction6 = $entry['pp7fFraction6'];
		$this->pp7fFraction7 = $entry['pp7fFraction7'];
		$this->pp7fFraction8 = $entry['pp7fFraction8'];
		$this->pp7fFraction9 = $entry['pp7fFraction9'];
		$this->pp7fFraction10 = $entry['pp7fFraction10'];
		$this->pp8fFraction1 = $entry['pp8fFraction1'];
		$this->pp8fFraction2 = $entry['pp8fFraction2'];
		$this->pp8fFraction3 = $entry['pp8fFraction3'];
		$this->pp8fFraction4 = $entry['pp8fFraction4'];
		$this->pp8fFraction5 = $entry['pp8fFraction5'];
		$this->pp8fFraction6 = $entry['pp8fFraction6'];
		$this->pp8fFraction7 = $entry['pp8fFraction7'];
		$this->pp8fFraction8 = $entry['pp8fFraction8'];
		$this->pp8fFraction9 = $entry['pp8fFraction9'];
		$this->pp8fFraction10 = $entry['pp8fFraction10'];
		$this->pp10fFraction1 = $entry['pp10fFraction1'];
		$this->pp10fFraction2 = $entry['pp10fFraction2'];
		$this->pp10fFraction3 = $entry['pp10fFraction3'];
		$this->pp10fFraction4 = $entry['pp10fFraction4'];
		$this->pp10fFraction5 = $entry['pp10fFraction5'];
		$this->pp10fFraction6 = $entry['pp10fFraction6'];
		$this->pp10fFraction7 = $entry['pp10fFraction7'];
		$this->pp10fFraction8 = $entry['pp10fFraction8'];
		$this->pp10fFraction9 = $entry['pp10fFraction9'];
		$this->pp10fFraction10 = $entry['pp10fFraction10'];
		$this->pp12fFraction1 = $entry['pp12fFraction1'];
		$this->pp12fFraction2 = $entry['pp12fFraction2'];
		$this->pp12fFraction3 = $entry['pp12fFraction3'];
		$this->pp12fFraction4 = $entry['pp12fFraction4'];
		$this->pp12fFraction5 = $entry['pp12fFraction5'];
		$this->pp12fFraction6 = $entry['pp12fFraction6'];
		$this->pp12fFraction7 = $entry['pp12fFraction7'];
		$this->pp12fFraction8 = $entry['pp12fFraction8'];
		$this->pp12fFraction9 = $entry['pp12fFraction9'];
		$this->pp12fFraction10 = $entry['pp12fFraction10'];
		$this->pp14fFraction1 = $entry['pp14fFraction1'];
		$this->pp14fFraction2 = $entry['pp14fFraction2'];
		$this->pp14fFraction3 = $entry['pp14fFraction3'];
		$this->pp14fFraction4 = $entry['pp14fFraction4'];
		$this->pp14fFraction5 = $entry['pp14fFraction5'];
		$this->pp14fFraction6 = $entry['pp14fFraction6'];
		$this->pp14fFraction7 = $entry['pp14fFraction7'];
		$this->pp14fFraction8 = $entry['pp14fFraction8'];
		$this->pp14fFraction9 = $entry['pp14fFraction9'];
		$this->pp14fFraction10 = $entry['pp14fFraction10'];
		$this->pp16fFraction1 = $entry['pp16fFraction1'];
		$this->pp16fFraction2 = $entry['pp16fFraction2'];
		$this->pp16fFraction3 = $entry['pp16fFraction3'];
		$this->pp16fFraction4 = $entry['pp16fFraction4'];
		$this->pp16fFraction5 = $entry['pp16fFraction5'];
		$this->pp16fFraction6 = $entry['pp16fFraction6'];
		$this->pp16fFraction7 = $entry['pp16fFraction7'];
		$this->pp16fFraction8 = $entry['pp16fFraction8'];
		$this->pp16fFraction9 = $entry['pp16fFraction9'];
		$this->pp16fFraction10 = $entry['pp16fFraction10'];
		$this->ppFirstFraction1 = $entry['ppFirstFraction1'];
		$this->ppFirstFraction2 = $entry['ppFirstFraction2'];
		$this->ppFirstFraction3 = $entry['ppFirstFraction3'];
		$this->ppFirstFraction4 = $entry['ppFirstFraction4'];
		$this->ppFirstFraction5 = $entry['ppFirstFraction5'];
		$this->ppFirstFraction6 = $entry['ppFirstFraction6'];
		$this->ppFirstFraction7 = $entry['ppFirstFraction7'];
		$this->ppFirstFraction8 = $entry['ppFirstFraction8'];
		$this->ppFirstFraction9 = $entry['ppFirstFraction9'];
		$this->ppFirstFraction10 = $entry['ppFirstFraction10'];
		$this->ppSecondFraction1 = $entry['ppSecondFraction1'];
		$this->ppSecondFraction2 = $entry['ppSecondFraction2'];
		$this->ppSecondFraction3 = $entry['ppSecondFraction3'];
		$this->ppSecondFraction4 = $entry['ppSecondFraction4'];
		$this->ppSecondFraction5 = $entry['ppSecondFraction5'];
		$this->ppSecondFraction6 = $entry['ppSecondFraction6'];
		$this->ppSecondFraction7 = $entry['ppSecondFraction7'];
		$this->ppSecondFraction8 = $entry['ppSecondFraction8'];
		$this->ppSecondFraction9 = $entry['ppSecondFraction9'];
		$this->ppSecondFraction10 = $entry['ppSecondFraction10'];
		$this->ppThirdFraction1 = $entry['ppThirdFraction1'];
		$this->ppThirdFraction2 = $entry['ppThirdFraction2'];
		$this->ppThirdFraction3 = $entry['ppThirdFraction3'];
		$this->ppThirdFraction4 = $entry['ppThirdFraction4'];
		$this->ppThirdFraction5 = $entry['ppThirdFraction5'];
		$this->ppThirdFraction6 = $entry['ppThirdFraction6'];
		$this->ppThirdFraction7 = $entry['ppThirdFraction7'];
		$this->ppThirdFraction8 = $entry['ppThirdFraction8'];
		$this->ppThirdFraction9 = $entry['ppThirdFraction9'];
		$this->ppThirdFraction10 = $entry['ppThirdFraction10'];
		$this->ppFinalTime1 = $entry['ppFinalTime1'];
		$this->ppFinalTime2 = $entry['ppFinalTime2'];
		$this->ppFinalTime3 = $entry['ppFinalTime3'];
		$this->ppFinalTime4 = $entry['ppFinalTime4'];
		$this->ppFinalTime5 = $entry['ppFinalTime5'];
		$this->ppFinalTime6 = $entry['ppFinalTime6'];
		$this->ppFinalTime7 = $entry['ppFinalTime7'];
		$this->ppFinalTime8 = $entry['ppFinalTime8'];
		$this->ppFinalTime9 = $entry['ppFinalTime9'];
		$this->ppFinalTime10 = $entry['ppFinalTime10'];
		$this->ppClaimedCode1 = $entry['ppClaimedCode1'];
		$this->ppClaimedCode2 = $entry['ppClaimedCode2'];
		$this->ppClaimedCode3 = $entry['ppClaimedCode3'];
		$this->ppClaimedCode4 = $entry['ppClaimedCode4'];
		$this->ppClaimedCode5 = $entry['ppClaimedCode5'];
		$this->ppClaimedCode6 = $entry['ppClaimedCode6'];
		$this->ppClaimedCode7 = $entry['ppClaimedCode7'];
		$this->ppClaimedCode8 = $entry['ppClaimedCode8'];
		$this->ppClaimedCode9 = $entry['ppClaimedCode9'];
		$this->ppClaimedCode10 = $entry['ppClaimedCode10'];
		$this->ppTrainer1 = $entry['ppTrainer1'];
		$this->ppTrainer2 = $entry['ppTrainer2'];
		$this->ppTrainer3 = $entry['ppTrainer3'];
		$this->ppTrainer4 = $entry['ppTrainer4'];
		$this->ppTrainer5 = $entry['ppTrainer5'];
		$this->ppTrainer6 = $entry['ppTrainer6'];
		$this->ppTrainer7 = $entry['ppTrainer7'];
		$this->ppTrainer8 = $entry['ppTrainer8'];
		$this->ppTrainer9 = $entry['ppTrainer9'];
		$this->ppTrainer10 = $entry['ppTrainer10'];
		$this->ppJockey1 = $entry['ppJockey1'];
		$this->ppJockey2 = $entry['ppJockey2'];
		$this->ppJockey3 = $entry['ppJockey3'];
		$this->ppJockey4 = $entry['ppJockey4'];
		$this->ppJockey5 = $entry['ppJockey5'];
		$this->ppJockey6 = $entry['ppJockey6'];
		$this->ppJockey7 = $entry['ppJockey7'];
		$this->ppJockey8 = $entry['ppJockey8'];
		$this->ppJockey9 = $entry['ppJockey9'];
		$this->ppJockey10 = $entry['ppJockey10'];
		$this->ppApprenticeWgtAllow1 = $entry['ppApprenticeWgtAllow1'];
		$this->ppApprenticeWgtAllow2 = $entry['ppApprenticeWgtAllow2'];
		$this->ppApprenticeWgtAllow3 = $entry['ppApprenticeWgtAllow3'];
		$this->ppApprenticeWgtAllow4 = $entry['ppApprenticeWgtAllow4'];
		$this->ppApprenticeWgtAllow5 = $entry['ppApprenticeWgtAllow5'];
		$this->ppApprenticeWgtAllow6 = $entry['ppApprenticeWgtAllow6'];
		$this->ppApprenticeWgtAllow7 = $entry['ppApprenticeWgtAllow7'];
		$this->ppApprenticeWgtAllow8 = $entry['ppApprenticeWgtAllow8'];
		$this->ppApprenticeWgtAllow9 = $entry['ppApprenticeWgtAllow9'];
		$this->ppApprenticeWgtAllow10 = $entry['ppApprenticeWgtAllow10'];
		$this->ppRaceType1 = $entry['ppRaceType1'];
		$this->ppRaceType2 = $entry['ppRaceType2'];
		$this->ppRaceType3 = $entry['ppRaceType3'];
		$this->ppRaceType4 = $entry['ppRaceType4'];
		$this->ppRaceType5 = $entry['ppRaceType5'];
		$this->ppRaceType6 = $entry['ppRaceType6'];
		$this->ppRaceType7 = $entry['ppRaceType7'];
		$this->ppRaceType8 = $entry['ppRaceType8'];
		$this->ppRaceType9 = $entry['ppRaceType9'];
		$this->ppRaceType10 = $entry['ppRaceType10'];
		$this->ppAgeSexRestrict1 = $entry['ppAgeSexRestrict1'];
		$this->ppAgeSexRestrict2 = $entry['ppAgeSexRestrict2'];
		$this->ppAgeSexRestrict3 = $entry['ppAgeSexRestrict3'];
		$this->ppAgeSexRestrict4 = $entry['ppAgeSexRestrict4'];
		$this->ppAgeSexRestrict5 = $entry['ppAgeSexRestrict5'];
		$this->ppAgeSexRestrict6 = $entry['ppAgeSexRestrict6'];
		$this->ppAgeSexRestrict7 = $entry['ppAgeSexRestrict7'];
		$this->ppAgeSexRestrict8 = $entry['ppAgeSexRestrict8'];
		$this->ppAgeSexRestrict9 = $entry['ppAgeSexRestrict9'];
		$this->ppAgeSexRestrict10 = $entry['ppAgeSexRestrict10'];
		$this->ppStateBredFlag1 = $entry['ppStateBredFlag1'];
		$this->ppStateBredFlag2 = $entry['ppStateBredFlag2'];
		$this->ppStateBredFlag3 = $entry['ppStateBredFlag3'];
		$this->ppStateBredFlag4 = $entry['ppStateBredFlag4'];
		$this->ppStateBredFlag5 = $entry['ppStateBredFlag5'];
		$this->ppStateBredFlag6 = $entry['ppStateBredFlag6'];
		$this->ppStateBredFlag7 = $entry['ppStateBredFlag7'];
		$this->ppStateBredFlag8 = $entry['ppStateBredFlag8'];
		$this->ppStateBredFlag9 = $entry['ppStateBredFlag9'];
		$this->ppStateBredFlag10 = $entry['ppStateBredFlag10'];
		$this->ppRestrictedQualifierFlag1 = $entry['ppRestrictedQualifierFlag1'];
		$this->ppRestrictedQualifierFlag2 = $entry['ppRestrictedQualifierFlag2'];
		$this->ppRestrictedQualifierFlag3 = $entry['ppRestrictedQualifierFlag3'];
		$this->ppRestrictedQualifierFlag4 = $entry['ppRestrictedQualifierFlag4'];
		$this->ppRestrictedQualifierFlag5 = $entry['ppRestrictedQualifierFlag5'];
		$this->ppRestrictedQualifierFlag6 = $entry['ppRestrictedQualifierFlag6'];
		$this->ppRestrictedQualifierFlag7 = $entry['ppRestrictedQualifierFlag7'];
		$this->ppRestrictedQualifierFlag8 = $entry['ppRestrictedQualifierFlag8'];
		$this->ppRestrictedQualifierFlag9 = $entry['ppRestrictedQualifierFlag9'];
		$this->ppRestrictedQualifierFlag10 = $entry['ppRestrictedQualifierFlag10'];
		$this->ppFavoriteIndicator1 = $entry['ppFavoriteIndicator1'];
		$this->ppFavoriteIndicator2 = $entry['ppFavoriteIndicator2'];
		$this->ppFavoriteIndicator3 = $entry['ppFavoriteIndicator3'];
		$this->ppFavoriteIndicator4 = $entry['ppFavoriteIndicator4'];
		$this->ppFavoriteIndicator5 = $entry['ppFavoriteIndicator5'];
		$this->ppFavoriteIndicator6 = $entry['ppFavoriteIndicator6'];
		$this->ppFavoriteIndicator7 = $entry['ppFavoriteIndicator7'];
		$this->ppFavoriteIndicator8 = $entry['ppFavoriteIndicator8'];
		$this->ppFavoriteIndicator9 = $entry['ppFavoriteIndicator9'];
		$this->ppFavoriteIndicator10 = $entry['ppFavoriteIndicator10'];
		$this->ppFrontBandages1 = $entry['ppFrontBandages1'];
		$this->ppFrontBandages2 = $entry['ppFrontBandages2'];
		$this->ppFrontBandages3 = $entry['ppFrontBandages3'];
		$this->ppFrontBandages4 = $entry['ppFrontBandages4'];
		$this->ppFrontBandages5 = $entry['ppFrontBandages5'];
		$this->ppFrontBandages6 = $entry['ppFrontBandages6'];
		$this->ppFrontBandages7 = $entry['ppFrontBandages7'];
		$this->ppFrontBandages8 = $entry['ppFrontBandages8'];
		$this->ppFrontBandages9 = $entry['ppFrontBandages9'];
		$this->ppFrontBandages10 = $entry['ppFrontBandages10'];
		$this->trainerCurStarts = $entry['trainerCurStarts'];
		$this->trainerCurWins = $entry['trainerCurWins'];
		$this->trainerCurPlaces = $entry['trainerCurPlaces'];
		$this->TrainerCurShows = $entry['TrainerCurShows'];
		$this->trainerCurROI = $entry['trainerCurROI'];
		$this->trainerPrevStarts = $entry['trainerPrevStarts'];
		$this->trainerPrevWins = $entry['trainerPrevWins'];
		$this->trainerPrevPlaces = $entry['trainerPrevPlaces'];
		$this->TrainerPrevShows = $entry['TrainerPrevShows'];
		$this->trainerPrevROI = $entry['trainerPrevROI'];
		$this->jockeyCurStarts = $entry['jockeyCurStarts'];
		$this->jockeyCurWins = $entry['jockeyCurWins'];
		$this->jockeyCurPlaces = $entry['jockeyCurPlaces'];
		$this->jockeyCurShows = $entry['jockeyCurShows'];
		$this->jockeyCurROI = $entry['jockeyCurROI'];
		$this->jockeyPrevStarts = $entry['jockeyPrevStarts'];
		$this->jockeyPrevWins = $entry['jockeyPrevWins'];
		$this->jockeyPrevPlaces = $entry['jockeyPrevPlaces'];
		$this->jockeyPrevShows = $entry['jockeyPrevShows'];
		$this->jockeyPrevROI = $entry['jockeyPrevROI'];
		$this->brisSpeedParForClass1 = $entry['brisSpeedParForClass1'];
		$this->brisSpeedParForClass2 = $entry['brisSpeedParForClass2'];
		$this->brisSpeedParForClass3 = $entry['brisSpeedParForClass3'];
		$this->brisSpeedParForClass4 = $entry['brisSpeedParForClass4'];
		$this->brisSpeedParForClass5 = $entry['brisSpeedParForClass5'];
		$this->brisSpeedParForClass6 = $entry['brisSpeedParForClass6'];
		$this->brisSpeedParForClass7 = $entry['brisSpeedParForClass7'];
		$this->brisSpeedParForClass8 = $entry['brisSpeedParForClass8'];
		$this->brisSpeedParForClass9 = $entry['brisSpeedParForClass9'];
		$this->brisSpeedParForClass10 = $entry['brisSpeedParForClass10'];
		$this->sireStudFee = $entry['sireStudFee'];
		$this->bestBrisFastTrack = $entry['bestBrisFastTrack'];
		$this->bestBrisTurf = $entry['bestBrisTurf'];
		$this->bestBrisOff = $entry['bestBrisOff'];
		$this->bestBrisDistance = $entry['bestBrisDistance'];
		$this->barShoe1 = $entry['barShoe1'];
		$this->barShoe2 = $entry['barShoe2'];
		$this->barShoe3 = $entry['barShoe3'];
		$this->barShoe4 = $entry['barShoe4'];
		$this->barShoe5 = $entry['barShoe5'];
		$this->barShoe6 = $entry['barShoe6'];
		$this->barShoe7 = $entry['barShoe7'];
		$this->barShoe8 = $entry['barShoe8'];
		$this->barShoe9 = $entry['barShoe9'];
		$this->barShoe10 = $entry['barShoe10'];
		$this->companyLineCode1 = $entry['companyLineCode1'];
		$this->companyLineCode2 = $entry['companyLineCode2'];
		$this->companyLineCode3 = $entry['companyLineCode3'];
		$this->companyLineCode4 = $entry['companyLineCode4'];
		$this->companyLineCode5 = $entry['companyLineCode5'];
		$this->companyLineCode6 = $entry['companyLineCode6'];
		$this->companyLineCode7 = $entry['companyLineCode7'];
		$this->companyLineCode8 = $entry['companyLineCode8'];
		$this->companyLineCode9 = $entry['companyLineCode9'];
		$this->companyLineCode10 = $entry['companyLineCode10'];
		$this->lowClaimingPriceOfRace1 = $entry['lowClaimingPriceOfRace1'];
		$this->lowClaimingPriceOfRace2 = $entry['lowClaimingPriceOfRace2'];
		$this->lowClaimingPriceOfRace3 = $entry['lowClaimingPriceOfRace3'];
		$this->lowClaimingPriceOfRace4 = $entry['lowClaimingPriceOfRace4'];
		$this->lowClaimingPriceOfRace5 = $entry['lowClaimingPriceOfRace5'];
		$this->lowClaimingPriceOfRace6 = $entry['lowClaimingPriceOfRace6'];
		$this->lowClaimingPriceOfRace7 = $entry['lowClaimingPriceOfRace7'];
		$this->lowClaimingPriceOfRace8 = $entry['lowClaimingPriceOfRace8'];
		$this->lowClaimingPriceOfRace9 = $entry['lowClaimingPriceOfRace9'];
		$this->lowClaimingPriceOfRace10 = $entry['lowClaimingPriceOfRace10'];
		$this->highClaimingPriceOfRace1 = $entry['highClaimingPriceOfRace1'];
		$this->highClaimingPriceOfRace2 = $entry['highClaimingPriceOfRace2'];
		$this->highClaimingPriceOfRace3 = $entry['highClaimingPriceOfRace3'];
		$this->highClaimingPriceOfRace4 = $entry['highClaimingPriceOfRace4'];
		$this->highClaimingPriceOfRace5 = $entry['highClaimingPriceOfRace5'];
		$this->highClaimingPriceOfRace6 = $entry['highClaimingPriceOfRace6'];
		$this->highClaimingPriceOfRace7 = $entry['highClaimingPriceOfRace7'];
		$this->highClaimingPriceOfRace8 = $entry['highClaimingPriceOfRace8'];
		$this->highClaimingPriceOfRace9 = $entry['highClaimingPriceOfRace9'];
		$this->highClaimingPriceOfRace10 = $entry['highClaimingPriceOfRace10'];
		$this->auctionPrice = $entry['auctionPrice'];
		$this->whenWhereAuction = $entry['whenWhereAuction'];
		$this->brisDirtPedigreeRating = $entry['brisDirtPedigreeRating'];
		$this->brisMudPedigreeRating = $entry['brisMudPedigreeRating'];
		$this->brisTurfPedigreeRating = $entry['brisTurfPedigreeRating'];
		$this->brisDistPedigreeRating = $entry['brisDistPedigreeRating'];
		$this->bestBrisLife = $entry['bestBrisLife'];
		$this->bestBrisMostRecentYear = $entry['bestBrisMostRecentYear'];
		$this->bestBrisPastYear = $entry['bestBrisPastYear'];
		$this->bestBrisTrack = $entry['bestBrisTrack'];
		$this->starts = $entry['starts'];
		$this->wins = $entry['wins'];
		$this->places = $entry['places'];
		$this->shows = $entry['shows'];
		$this->earnings = $entry['earnings'];
		$this->keyTrainerStatCategory1 = $entry['keyTrainerStatCategory1'];
		$this->keyTrainerStatStarts1 = $entry['keyTrainerStatStarts1'];
		$this->keyTrainerStatWinPct1 = $entry['keyTrainerStatWinPct1'];
		$this->keyTrainerStatITM1 = $entry['keyTrainerStatITM1'];
		$this->keyTrainerStatROI1 = $entry['keyTrainerStatROI1'];
		$this->keyTrainerStatCategory2 = $entry['keyTrainerStatCategory2'];
		$this->keyTrainerStatStarts2 = $entry['keyTrainerStatStarts2'];
		$this->keyTrainerStatWinPct2 = $entry['keyTrainerStatWinPct2'];
		$this->keyTrainerStatITM2 = $entry['keyTrainerStatITM2'];
		$this->keyTrainerStatROI2 = $entry['keyTrainerStatROI2'];
		$this->keyTrainerStatCategory3 = $entry['keyTrainerStatCategory3'];
		$this->keyTrainerStatStarts3 = $entry['keyTrainerStatStarts3'];
		$this->keyTrainerStatWinPct3 = $entry['keyTrainerStatWinPct3'];
		$this->keyTrainerStatITM3 = $entry['keyTrainerStatITM3'];
		$this->keyTrainerStatROI3 = $entry['keyTrainerStatROI3'];
		$this->keyTrainerStatCategory4 = $entry['keyTrainerStatCategory4'];
		$this->keyTrainerStatStarts4 = $entry['keyTrainerStatStarts4'];
		$this->keyTrainerStatWinPct4 = $entry['keyTrainerStatWinPct4'];
		$this->keyTrainerStatITM4 = $entry['keyTrainerStatITM4'];
		$this->keyTrainerStatROI4 = $entry['keyTrainerStatROI4'];
		$this->keyTrainerStatCategory5 = $entry['keyTrainerStatCategory5'];
		$this->keyTrainerStatStarts5 = $entry['keyTrainerStatStarts5'];
		$this->keyTrainerStatWinPct5 = $entry['keyTrainerStatWinPct5'];
		$this->keyTrainerStatITM5 = $entry['keyTrainerStatITM5'];
		$this->keyTrainerStatROI5 = $entry['keyTrainerStatROI5'];
		$this->keyTrainerStatCategory6 = $entry['keyTrainerStatCategory6'];
		$this->keyTrainerStatStarts6 = $entry['keyTrainerStatStarts6'];
		$this->keyTrainerStatWinPct6 = $entry['keyTrainerStatWinPct6'];
		$this->keyTrainerStatITM6 = $entry['keyTrainerStatITM6'];
		$this->keyTrainerStatROI6 = $entry['keyTrainerStatROI6'];
		$this->jockeyDistanceOnTurfLabel = $entry['jockeyDistanceOnTurfLabel'];
		$this->jockeyDistanceOnTurfStarts = $entry['jockeyDistanceOnTurfStarts'];
		$this->jockeyDistanceOnTurfWins = $entry['jockeyDistanceOnTurfWins'];
		$this->jockeyDistanceOnTurfPlaces = $entry['jockeyDistanceOnTurfPlaces'];
		$this->jockeyDistanceOnTurfShows = $entry['jockeyDistanceOnTurfShows'];
		$this->jockeyDistanceOnTurfROI = $entry['jockeyDistanceOnTurfROI'];
		$this->jockeyDistanceOnTurfEarnings = $entry['jockeyDistanceOnTurfEarnings']; 
		$this->scratched = $entry['scratched']; 
		$this->contender = $entry['contender']; 
		$this->comments = $entry['comments']; 
		$this->wager = $entry['wager']; 
		$this->payout = $entry['payout']; 
        
		//echo "<br>" . $this->raceID . " -- " . $this->horseName; 
		//show_array($this); 
        }

	function load_entry() { 
		
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 "; 
	    for ($i=0; $i<sizeof($this->entry_fields); $i++) { 
		    $sql .= $this->entry_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2); 	
	    $sql .="	
	    		FROM	 entry
	    		WHERE	 entryID = " . $this->entryID;	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		
    	foreach ($this->entry_fields as $key) { 
	    	$this->$key = $recordSet->fields[$key];
    		}
	    	
    	//return $recordSet; 
	
    }

    function save_entry () {

        global $conn, $debug;

        // add data valaidation
        $sql = "INSERT INTO   entry
                        (raceID, postPosition, entry, horseClaimingPrice, breedType, tdyNasalStripChange, tdyTrainer, 
                         trainerStats, trainerWins, trainerPlaces, trainerShows, tdyJockey, apprenticeWgtallow, 
                         jockeySts, jockeyWins, jockeyPlaces, jockeyShows, tdyOwner, ownerSilks, MTO_AE, 
                         programNumber, morningLine, horseName, yearOfBirth, foalingMonth, sex, horseColor, 
                         weight, sire, sireSire, dam, damsSire, breeder, bredState, programPostPosition, 
                         todaysMeds1, todaysMeds2, equipmentChange, distStarts, distWins, distPlaces, 
                         distShows, distEarnings, trackStarts, trackWins, trackPlaces, trackShows, trackEarnings, 
                         turfStarts, turfWins, turfPlaces, turfShows, turfEarnings, wetStarts, wetWins, wetPlaces, 
                         wetShows, wetEarnings, curYear, curStarts, curWins, curPlaces, curShows, curEarnings, 
                         prevYear, prevStarts, prevWins, prevPlaces, prevShows, prevEarnings, lifeStarts, 
                         lifeWins, lifePlaces, lifeShows, lifeEarnings, BrisRunStyle, Quirin, daysSinceLastRace, 
                         BrisPrimePowerRating, trainerCurStarts, trainerCurWins, trainerCurPlaces, TrainerCurShows, 
                         trainerCurROI, trainerPrevStarts, trainerPrevWins, trainerPrevPlaces, TrainerPrevShows, 
                         trainerPrevROI, jockeyCurStarts, jockeyCurWins, jockeyCurPlaces, jockeyCurShows, 
                         jockeyCurROI, jockeyPrevStarts, jockeyPrevWins, jockeyPrevPlaces, jockeyPrevShows, 
                         jockeyPrevROI, sireStudFee, bestBrisFastTrack, bestBrisTurf, bestBrisOff, bestBrisDistance, 
                         auctionPrice, whenWhereAuction, brisDirtPedigreeRating, brisMudPedigreeRating, 
                         brisTurfPedigreeRating, brisDistPedigreeRating, bestBrisLife, bestBrisMostRecentYear, 
                         bestBrisPastYear, bestBrisTrack, starts, wins, places, shows, earnings, 
                         jockeyDistanceOnTurfLabel, jockeyDistanceOnTurfStarts, jockeyDistanceOnTurfWins, 
                         jockeyDistanceOnTurfPlaces, jockeyDistanceOnTurfShows, jockeyDistanceOnTurfROI, 
                         jockeyDistanceOnTurfEarnings)
                VALUES
                        ( 	" . $this->raceID . ",
							" . (int)$this->postPosition . ",
							" . $conn->qstr($this->entry) . ",
							" . (int)$this->horseClaimingPrice . ",
							" . $conn->qstr($this->breedType) . ",
							" . (int)$this->tdyNasalStripChange . ",
							" . $conn->qstr($this->tdyTrainer) . ",
							" . (int)$this->trainerStats . ",
							" . (int)$this->trainerWins . ",
							" . (int)$this->trainerPlaces . ",
							" . (int)$this->trainerShows . ",
							" . $conn->qstr($this->tdyJockey) . ",
							" . (int)$this->apprenticeWgtallow . ",
							" . (int)$this->jockeySts . ",
							" . (int)$this->jockeyWins . ",
							" . (int)$this->jockeyPlaces . ",
							" . (int)$this->jockeyShows . ",
							" . $conn->qstr($this->tdyOwner) . ",
							" . $conn->qstr($this->ownerSilks) . ",
							" . $conn->qstr($this->MTO_AE) . ",
							" . $conn->qstr($this->programNumber) . ",
							" . (float)$this->morningLine . ",
							" . $conn->qstr($this->horseName) . ",
							" . (int)$this->yearOfBirth . ",
							" . (int)$this->foalingMonth . ",
							" . $conn->qstr($this->sex) . ",
							" . $conn->qstr($this->horseColor) . ",
							" . (int)$this->weight . ",
							" . $conn->qstr($this->sire) . ",
							" . $conn->qstr($this->sireSire) . ",
							" . $conn->qstr($this->dam) . ",
							" . $conn->qstr($this->damsSire) . ",
							" . $conn->qstr($this->breeder) . ",
							" . $conn->qstr($this->bredState) . ",
							" . $conn->qstr($this->programPostPosition) . ",
							" . (int)$this->todaysMeds1 . ",
							" . (int)$this->todaysMeds2 . ",
							" . (int)$this->equipmentChange . ",
							" . (int)$this->distStarts . ",
							" . (int)$this->distWins . ",
							" . (int)$this->distPlaces . ",
							" . (int)$this->distShows . ",
							" . (int)$this->distEarnings . ",
							" . (int)$this->trackStarts . ",
							" . (int)$this->trackWins . ",
							" . (int)$this->trackPlaces . ",
							" . (int)$this->trackShows . ",
							" . (int)$this->trackEarnings . ",
							" . (int)$this->turfStarts . ",
							" . (int)$this->turfWins . ",
							" . (int)$this->turfPlaces . ",
							" . (int)$this->turfShows . ",
							" . (int)$this->turfEarnings . ",
							" . (int)$this->wetStarts . ",
							" . (int)$this->wetWins . ",
							" . (int)$this->wetPlaces . ",
							" . (int)$this->wetShows . ",
							" . (int)$this->wetEarnings . ",
							" . (int)$this->curYear . ",
							" . (int)$this->curStarts . ",
							" . (int)$this->curWins . ",
							" . (int)$this->curPlaces . ",
							" . (int)$this->curShows . ",
							" . (int)$this->curEarnings . ",
							" . (int)$this->prevYear . ",
							" . (int)$this->prevStarts . ",
							" . (int)$this->prevWins . ",
							" . (int)$this->prevPlaces . ",
							" . (int)$this->prevShows . ",
							" . (int)$this->prevEarnings . ",
							" . (int)$this->lifeStarts . ",
							" . (int)$this->lifeWins . ",
							" . (int)$this->lifePlaces . ",
							" . (int)$this->lifeShows . ",
							" . (int)$this->lifeEarnings . ",
							" . $conn->qstr($this->BrisRunStyle) . ",
							" . (int)$this->Quirin . ",
							" . (int)$this->daysSinceLastRace . ",
							" . $conn->qstr($this->BrisPrimePowerRating) . ",
							" . (int)$this->trainerCurStarts . ",
							" . (int)$this->trainerCurWins . ",
							" . (int)$this->trainerCurPlaces . ",
							" . (int)$this->TrainerCurShows . ",
							" . (float)$this->trainerCurROI . ",
							" . (int)$this->trainerPrevStarts . ",
							" . (int)$this->trainerPrevWins . ",
							" . (int)$this->trainerPrevPlaces . ",
							" . (int)$this->TrainerPrevShows . ",
							" . (float)$this->trainerPrevROI . ",
							" . (int)$this->jockeyCurStarts . ",
							" . (int)$this->jockeyCurWins . ",
							" . (int)$this->jockeyCurPlaces . ",
							" . (int)$this->jockeyCurShows . ",
							" . (float)$this->jockeyCurROI . ",
							" . (int)$this->jockeyPrevStarts . ",
							" . (int)$this->jockeyPrevWins . ",
							" . (int)$this->jockeyPrevPlaces . ",
							" . (int)$this->jockeyPrevShows . ",
							" . (float)$this->jockeyPrevROI . ",
							" . (int)$this->sireStudFee . ",
							" . (int)$this->bestBrisFastTrack . ",
							" . (int)$this->bestBrisTurf . ",
							" . (int)$this->bestBrisOff . ",
							" . (int)$this->bestBrisDistance . ",
							" . (int)$this->auctionPrice . ",
							" . (int)$this->whenWhereAuction . ",
							" . $conn->qstr($this->brisDirtPedigreeRating) . ",
							" . $conn->qstr($this->brisMudPedigreeRating) . ",
							" . $conn->qstr($this->brisTurfPedigreeRating) . ",
							" . $conn->qstr($this->brisDistPedigreeRating) . ",
							" . (int)$this->bestBrisLife . ",
							" . (int)$this->bestBrisMostRecentYear . ",
							" . (int)$this->bestBrisPastYear . ",
							" . (int)$this->bestBrisTrack . ",
							" . (int)$this->starts . ",
							" . (int)$this->wins . ",
							" . (int)$this->places . ",
							" . (int)$this->shows . ",
							" . (int)$this->earnings . ",
							" . (int)$this->jockeyDistanceOnTurfLabel . ",
							" . (int)$this->jockeyDistanceOnTurfStarts . ",
							" . (int)$this->jockeyDistanceOnTurfWins . ",
							" . (int)$this->jockeyDistanceOnTurfPlaces . ",
							" . (int)$this->jockeyDistanceOnTurfShows . ",
							" . (float)$this->jockeyDistanceOnTurfROI . ",
							" . (int)$this->jockeyDistanceOnTurfEarnings . "
                          )";

        if ($debug) { 
	        echo "<br>sql = " . $sql;
        	}	
        $recordSet = execute_sql($sql);

        $ID = $conn->Insert_ID();
        $this->entryID = $ID;

        //echo "<br>inserted - ". $this->horseName; 
        //$this->save_entryCall(); 
        
        return $ID;

        }

    function save_workouts () {

        global $conn, $debug;
        
        for ($j=0; $j<sizeof($this->workout_fields); $j++) { 
 			for ($i=1; $i<12; $i++) { 
	 			$fieldName = $this->workout_fields[$j] . $i;
	 			$arrName = $this->workout_fields[$j]; 
	 			$workout[$this->workout_fields[$j]][$i-1] = $this->$fieldName; 
	 			//$arrName[$j] = $this->$fieldName;
 				//echo "<br> -- " . $workout_fields[$j] . " -- " . $this->$fieldName . " -- " . $arrName;
	 			}
			
 			}	
 		//show_array($workout); 
	    //return;     
        for ($i=0; $i<11; $i++) { 
       		$workDate = date("Y-m-d", strtotime($workout['dateWorkout'][$i]));	
	        //echo "<br>track - " . $trackWorkout[$i] . "  date - " . $workDate . " dateWorkout - " . $dateWorkout[$i]; 
       		
	        if ($workout['trackWorkout'][$i]) { 	// make sure workout isn't empty
		        // add data valaidation
		        $sql = "INSERT INTO   workouts
		                        (entryID, dateWorkout, timeWorkout, trackWorkout, distanceWorkout, conditionWorkout, 
	        					   describeWorkout, innerIndicateWorkout, numWorksWorkout, rankWorkout)
		                VALUES
		                        ( " . $this->entryID . ",
		                          " . $conn->qstr($workDate) . ",
		                          " . (float)$workout['timeWorkout'][$i]  . ", 
		                          " . $conn->qstr($workout['trackWorkout'][$i]) . ",
		                          " . (int)$workout['distanceWorkout'][$i] . ",
		                          " . $conn->qstr($workout['conditionWorkout'][$i]) . ",
		                          " . $conn->qstr($workout['describeWorkout'][$i]) . ",
		                          " . $conn->qstr($workout['innerIndicateWorkout'][$i]) . ",
		                          " . (int)$workout['numWorksWorkout'][$i] . ",
		                          " . (int)$workout['rankWorkout'][$i] . "
		                          )";
		
		         if ($debug) { 
			        echo "<br>sql = " . $sql;
		        	}	
		        $recordSet = execute_sql($sql);
				}
	    	}
        }        

        
     function save_pps() {

        global $conn, $debug;
        
   	     for ($j=0; $j<sizeof($this->pp_fields); $j++) { 
 			for ($i=1; $i<15; $i++) { 
	 			$fieldName = $this->pp_fields[$j] . $i;
	 			$arrName = $this->pp_fields[$j]; 
	 			$pp[$this->pp_fields[$j]][$i-1] = $this->$fieldName; 
	 			//$arrName[$j] = $this->$fieldName;
 				//echo "<br> -- " . $pp_fields[$j] . " -- " . $this->$fieldName . " -- " . $arrName;
	 			}
			
 			}	
 		//show_array($pp[ppTrackCode]); 
	    //return;     
        for ($i=0; $i<10; $i++) { 
       		$raceDate = date("Y-m-d", strtotime($pp['ppRaceDate'][$i]));	
	        //echo "<br>track - $i - " . $pp['trackCode'][$i] . "  date - " . $raceDate . " ppRaceDate - " . $pp['ppRaceDate'][$i]; 
       		
	        if ($pp['ppTrackCode'][$i]) { 	// make sure workout isn't empty
		        // add data valaidation
		        $sql = "INSERT INTO   pp
		                        (entryID, ppRaceDate, ppDaysPrev, ppTrackCode, ppBrisTrackCode, ppRaceNum, ppTrackCond, 
		                         ppDistanceYards, ppSurface, ppSpecialChute, ppNumEntrants, ppPostPosition, ppEquipment, 
		                         ppMeds, ppTripComment, ppWinnersName, pp2ndPlaceName, pp3rdPlaceName, ppWinnersWeight, 
		                         pp2ndPlaceWeight, pp3rdPlaceWeight, ppWinnersMargin, pp2ndPlaceMargin, pp3rdPlaceMargin, 
		                         ppExtraComment, ppWeight, ppOdds, ppEntry, ppRaceClassification, ppClaimingPriceHorse, 
		                         ppPurse, ppStartingCallPos, ppFirstCallPos, ppSecondCallPos, ppStretchPos, ppFinishPos, ppMoneyPos, 
		                         ppStartCallBeatenMargin, ppStartCallBeaten, ppFirstCallBeatenMargin, ppFirstCallBeaten, 
		                         ppSecondCallBeatenMargin, ppSecondCallBeaten, ppStretchBeatenMargin, ppStretchBeaten, 
		                         ppFinishBeatenMargin, ppFinishBeaten, ppBris2fPaceRating, ppBris4fPaceRating, 
		                         ppBris6fPaceRating, ppBris8fPaceRating, ppBris10fPaceRating, ppBrisLatePaceRating, 
		                         ppBrisSpeedRating, ppDRFSpeedRating, ppDRFTrackVariant, pp2fFraction, pp3fFraction, 
		                         pp4fFraction, pp5fFraction, pp6fFraction, pp7fFraction, pp8fFraction, pp10fFraction, 
		                         pp12fFraction, pp14fFraction, pp16fFraction, ppFirstFraction, ppSecondFraction, 
		                         ppThirdFraction, ppFinalTime, ppClaimedCode, ppTrainer, ppJockey, ppApprenticeWgtAllow, 
		                         ppRaceType, ppAgeSexRestrict, ppStateBredFlag, ppRestrictedQualifierFlag, 
		                         ppFavoriteIndicator, ppFrontBandages, brisSpeedParForClass, barShoe, companyLineCode, 
		                         lowClaimingPriceOfRace, highClaimingPriceOfRace)
		                VALUES
		                        ( 	" . $this->entryID . ",
									" . $conn->qstr($raceDate) . ",
									" . (int)$pp['ppDaysPrev'][$i] . ",
									" . $conn->qstr($pp['ppTrackCode'][$i]) . ",
									" . $conn->qstr($pp['ppBrisTrackCode'][$i]) . ",
									" . (int)$pp['ppRaceNum'][$i] . ",
									" . $conn->qstr($pp['ppTrackCond'][$i]) . ",
									" . (int)$pp['ppDistanceYards'][$i] . ",
									" . $conn->qstr($pp['ppSurface'][$i]) . ",
									" . $conn->qstr($pp['ppSpecialChute'][$i]) . ",
									" . (int)$pp['ppNumEntrants'][$i] . ",
									" . (int)$pp['ppPostPosition'][$i] . ",
									" . $conn->qstr($pp['ppEquipment'][$i]) . ",
									" . (int)$pp['ppMeds'][$i] . ",
									" . $conn->qstr($pp['ppTripComment'][$i]) . ",
									" . $conn->qstr($pp['ppWinnersName'][$i]) . ",
									" . $conn->qstr($pp['pp2ndPlaceName'][$i]) . ",
									" . $conn->qstr($pp['pp3rdPlaceName'][$i]) . ",
									" . (int)$pp['ppWinnersWeight'][$i] . ",
									" . (int)$pp['pp2ndPlaceWeight'][$i] . ",
									" . (int)$pp['pp3rdPlaceWeight'][$i] . ",
									" . (float)$pp['ppWinnersMargin'][$i] . ",
									" . (float)$pp['pp2ndPlaceMargin'][$i] . ",
									" . (float)$pp['pp3rdPlaceMargin'][$i] . ",
									" . $conn->qstr($pp['ppExtraComment'][$i]) . ",
									" . (int)$pp['ppWeight'][$i] . ",
									" . (float)$pp['ppOdds'][$i] . ",
									" . $conn->qstr($pp['ppEntry'][$i]) . ",
									" . $conn->qstr($pp['ppRaceClassification'][$i]) . ",
									" . (int)$pp['ppClaimingPriceHorse'][$i] . ",
									" . (int)$pp['ppPurse'][$i] . ",
									" . (int)$pp['ppStartingCallPos'][$i] . ",
									" . $conn->qstr($pp['ppFirstCallPos'][$i]) . ",
									" . $conn->qstr($pp['ppSecondCallPos'][$i]) . ",
									" . $conn->qstr($pp['ppStretchPos'][$i]) . ",
									" . $conn->qstr($pp['ppFinishPos'][$i]) . ",
									" . $conn->qstr($pp['ppMoneyPos'][$i]) . ",
									" . (float)$pp['ppStartCallBeatenMargin'][$i] . ",
									" . (float)$pp['ppStartCallBeaten'][$i] . ",
									" . (float)$pp['ppFirstCallBeatenMargin'][$i] . ",
									" . (float)$pp['ppFirstCallBeaten'][$i] . ",
									" . (float)$pp['ppSecondCallBeatenMargin'][$i] . ",
									" . (float)$pp['ppSecondCallBeaten'][$i] . ",
									" . (float)$pp['ppStretchBeatenMargin'][$i] . ",
									" . (float)$pp['ppStretchBeaten'][$i] . ",
									" . (float)$pp['ppFinishBeatenMargin'][$i] . ",
									" . (float)$pp['ppFinishBeaten'][$i] . ",
									" . (int)$pp['ppBris2fPaceRating'][$i] . ",
									" . (int)$pp['ppBris4fPaceRating'][$i] . ",
									" . (int)$pp['ppBris6fPaceRating'][$i] . ",
									" . (int)$pp['ppBris8fPaceRating'][$i] . ",
									" . (int)$pp['ppBris10fPaceRating'][$i] . ",
									" . (int)$pp['ppBrisLatePaceRating'][$i] . ",
									" . (int)$pp['ppBrisSpeedRating'][$i] . ",
									" . (int)$pp['ppDRFSpeedRating'][$i] . ",
									" . (int)$pp['ppDRFTrackVariant'][$i] . ",
									" . (float)$pp['pp2fFraction'][$i] . ",
									" . (float)$pp['pp3fFraction'][$i] . ",
									" . (float)$pp['pp4fFraction'][$i] . ",
									" . (float)$pp['pp5fFraction'][$i] . ",
									" . (float)$pp['pp6fFraction'][$i] . ",
									" . (float)$pp['pp7fFraction'][$i] . ",
									" . (float)$pp['pp8fFraction'][$i] . ",
									" . (float)$pp['pp10fFraction'][$i] . ",
									" . (float)$pp['pp12fFraction'][$i] . ",
									" . (float)$pp['pp14fFraction'][$i] . ",
									" . (float)$pp['pp16fFraction'][$i] . ",
									" . (float)$pp['ppFirstFraction'][$i] . ",
									" . (float)$pp['ppSecondFraction'][$i] . ",
									" . (float)$pp['ppThirdFraction'][$i] . ",
									" . (float)$pp['ppFinalTime'][$i] . ",
									" . $conn->qstr($pp['ppClaimedCode'][$i]) . ",
									" . $conn->qstr($pp['ppTrainer'][$i]) . ",
									" . $conn->qstr($pp['ppJockey'][$i]) . ",
									" . (int)$pp['ppApprenticeWgtAllow'][$i] . ",
									" . $conn->qstr($pp['ppRaceType'][$i]) . ",
									" . $conn->qstr($pp['ppAgeSexRestrict'][$i]) . ",
									" . $conn->qstr($pp['ppStateBredFlag'][$i]) . ",
									" . $conn->qstr($pp['ppRestrictedQualifierFlag'][$i]) . ",
									" . (int)$pp['ppFavoriteIndicator'][$i] . ",
									" . (int)$pp['ppFrontBandages'][$i] . ",
									" . (int)$pp['brisSpeedParForClass'][$i] . ",
									" . $conn->qstr($pp['barShoe'][$i]) . ",
									" . $conn->qstr($pp['companyLineCode'][$i]) . ",
									" . (int)$pp['lowClaimingPriceOfRace'][$i] . ",
									" . (int)$pp['lowClaimingPriceOfRace'][$i] . "
		                          )";
		         if ($debug) { 
			        echo "<br>sql = " . $sql;
		        	}	
		        $recordSet = execute_sql($sql);
				}
	    	}
        }        

        
	function save_trainerStats() {

        global $conn, $debug;
        
   	     for ($j=0; $j<sizeof($this->ts_fields); $j++) { 
 			for ($i=1; $i<7; $i++) { 
	 			$fieldName = $this->ts_fields[$j] . $i;
	 			$arrName = $this->ts_fields[$j]; 
	 			$ts[$this->ts_fields[$j]][$i-1] = $this->$fieldName; 
	 			//$arrName[$j] = $this->$fieldName;
 				//echo "<br> -- " . $pp_fields[$j] . " -- " . $this->$fieldName . " -- " . $arrName;
	 			}
			
 			}	
 		//show_array($pp[ppTrackCode]); 
	    //return;     
        for ($i=0; $i<7; $i++) { 
       		
	        if ($ts['keyTrainerStatCategory'][$i]) { 	// make sure workout isn't empty
		        // add data valaidation
		        $sql = "INSERT INTO   trainerStats
		                        ( entryID, keyTrainerStatCategory, keyTrainerStatStarts, keyTrainerStatWinPct, 
		                          keyTrainerStatITM, keyTrainerStatROI)
		                VALUES
		                        ( 	" . $this->entryID . ",
									" . $conn->qstr($ts['keyTrainerStatCategory'][$i]) . ",
									" . (int)$ts['keyTrainerStatStarts'][$i] . ",
									" . (float)$ts['keyTrainerStatWinPct'][$i] . ",
									" . (float)$ts['keyTrainerStatITM'][$i] . ",
									" . (float)$ts['keyTrainerStatROI'][$i] . "
		                          )";
		         if ($debug) { 
			        echo "<br>sql = " . $sql;
		        	}	
		        $recordSet = execute_sql($sql);
				}
	    	}
        }        
	function save_jockeyStats() {

        global $conn, $debug;
        	     
        // add data valaidation
        $sql = "INSERT INTO   jockeyStats
                        ( entryID, jockeyDistanceOnTurfLabel, jockeyDistanceOnTurfStarts, jockeyDistanceOnTurfWins, 
                          jockeyDistanceOnTurfPlaces, jockeyDistanceOnTurfShows, jockeyDistanceOnTurfROI, 
                          jockeyDistanceOnTurfEarnings)
                VALUES
                        ( 	" . $this->entryID . ",
							" . $conn->qstr($this->jockeyDistanceOnTurfLabel) . ",
							" . (int)$this->jockeyDistanceOnTurfStarts . ",
							" . (int)$this->jockeyDistanceOnTurfWins . ",
							" . (int)$this->jockeyDistanceOnTurfPlaces . ",
							" . (int)$this->jockeyDistanceOnTurfShows . ",
							" . (float)$this->jockeyDistanceOnTurfROI . ",
							" . (int)$this->jockeyDistanceOnTurfEarnings . "
                          )";
        
        $recordSet = execute_sql($sql);
        }   
        
    function get_entry() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 "; 
	    for ($i=0; $i<sizeof($this->entry_fields); $i++) { 
		    $sql .= $this->entry_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2); 	
	    $sql .="	
	    		FROM	 entry
	    		WHERE	 entryID = " . $this->entryID;	
	    
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
 		return $recordSet; 
	
    }

    function get_pps() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 ppID, "; 
	    for ($i=0; $i<sizeof($this->pp_fields); $i++) { 
		    $sql .= $this->pp_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2); 	
	    $sql .="	
	    		FROM	 pp
	    		WHERE	 entryID = " . $this->entryID;	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		return $recordSet; 
	
    }
    
    function get_single_pp($ppID) { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 ppID, entryID, "; 
	    for ($i=0; $i<sizeof($this->pp_fields); $i++) { 
		    $sql .= $this->pp_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2); 	
	    $sql .="	
	    		FROM	 pp
	    		WHERE	 ppID = " . $ppID;	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		return $recordSet; 
	
    }

    function get_multiple_pps($numToFetch) { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 ppID, "; 
	    for ($i=0; $i<sizeof($this->pp_fields); $i++) { 
		    $sql .= $this->pp_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2); 	
	    $sql .="	
	    		FROM	 pp
	    		WHERE	 entryID = " . $this->entryID . "
	    		ORDER BY	ppID ASC
	    		LIMIT		0, " . $numToFetch;	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		return $recordSet; 
	
    }


    function get_jockeyStats() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 "; 
	    for ($i=0; $i<sizeof($this->jockeyStats_fields); $i++) { 
		    $sql .= $this->jockeyStats_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2); 	
	    $sql .="	
	    		FROM	 jockeyStats
	    		WHERE	 entryID = " . $this->entryID;	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		return $recordSet;  	
    }  
    
    function get_trainerStats() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 "; 
	    for ($i=0; $i<sizeof($this->ts_fields); $i++) { 
		    $sql .= $this->ts_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2); 	
	    $sql .="	
	    		FROM	 trainerStats
	    		WHERE	 entryID = " . $this->entryID;	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		return $recordSet;  	
    }  
    
    function get_workouts() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 "; 
	    for ($i=0; $i<sizeof($this->workout_fields); $i++) { 
		    $sql .= $this->workout_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2); 	
	    $sql .="	
	    		FROM	 workouts
	    		WHERE	 entryID = " . $this->entryID;	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		return $recordSet;  	
    } 
    
    function select_pp($ppID) { 
	    
	    global $conn, $debug; 
	    
	    $sql = "UPDATE 	 	pp 
	    		SET			selected = 1 
	    		WHERE		ppID = " . $ppID; 
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//return $recordSet; 
	
    } 
    
    function update_scratched($entryID) { 
	    
	    global $conn, $debug; 
	    
	    $sql = "UPDATE 	 	entry
	    		SET			scratched = 1 
	    		WHERE		entryID = " . $entryID; 
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//return $recordSet; 
	
    }     

    function update_comments($entryID, $comments) { 
	    
	    global $conn, $debug; 
	    
	    $sql = "UPDATE 	 	entry
	    		SET			comments = " . $conn->qstr($comments) . "
	    		WHERE		entryID = " . $entryID; 
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//return $recordSet; 
	
    }     
          
    function get_pick() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 	position
	    		FROM	 	picks
	    		WHERE		entryID = " . $this->entryID;
	    		
	    $recordSet = execute_sql($sql);
    	$pick = $recordSet->fields[0]; 
		//show_array($recordSet);
		return $pick;  	
    } 
    
    function save_calcs($med=0, $te=0, $ppID) {

	    if (!($med)) {
		    $med = 0; 
	    	$te = 0; 
		    }
	    //echo "<br>inside = $med  ---   $te  -- $ppID"; 
        global $conn, $debug;
        	     
        $sql = "UPDATE  pp
        		SET		ppCalcMed = " . $med . ",
        				ppCalcTE = " .  $te . "
        		WHERE	ppID = " . $ppID; 
        //echo "<br>" . $sql; 		  
        $recordSet = execute_sql($sql);
        }   
  
     	               
}
?>