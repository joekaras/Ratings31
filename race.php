<?

/*
  HandicappingOS, Open Source Handicapping Solutions
  http://www.handicappingOS

  Copyright (c) 2005 Richard Rosa

  Released under the GNU General Public License
*/

class race
{
	var $raceID;
    var $track;
    var $raceDate;
    var $raceNum;
    var $distanceYards; 
    var $surface; 
    var $raceType;
	var $ageSexRestriction;
	var $tdyRaceClassification;
	var $purse;
	var $claimingPrice;
	var $trackRecord;
	var $raceConditions; 
	var $tdyLasixList; 
	var $tdyButeList; 
	var $tdyCoupledList; 
	var $tdyMutelList; 	
	var $simHostTrackCode;
	var $simHostTrackRaceNum;
	var $twoFBrisPaceParForLevel;
	var $fourFBrisPaceParForLevel;
	var $sixFBrisPaceParForLevel;
	var $BrisSpeedParForClassLevel;
	var $BrisLatePaceParForLevel;
	var $drfRaceCondition;
	var $wagerTypes;
	var $raceComments;
	var	$score_fields = array( 
		"fps1", "fps2", "fps3", "ep", "sp", "ap", "lp", "fx",	"fw", "te", "pctEarly",
		"lastTwo", "med", "he", "decl", "intEnergy", "fps1Rank", "fps2Rank", "fps3Rank", "epRank", "spRank", "apRank", 
		"lpRank", "fxRank", "fwRank", "teRank", "pctEarlyRank", "lastTwoRank", "medRank", "heRank",  "declRank", "intEnergyRank", 
		"p1", "p1Rank", "r1", "r1Rank");  
		    
    function race($raceID = "") {
		
	    global $debug, $conn;    
	    
	    if ($raceID) { 
		    
		    $this->raceID = $raceID; 
			$sql = "SELECT     	track, raceDate, raceNum, distanceYards, surface, raceType, ageSexRestriction,
								tdyRaceClassification, purse, claimingPrice, trackRecord, raceConditions, simHostTrackCode, 
								simHostTrackRaceNum, twoFBrisPaceParForLevel, fourFBrisPaceParForLevel, sixFBrisPaceParForLevel, 
								BrisSpeedParForClassLevel, BrisLatePaceParForLevel, drfRaceCondition, wagerTypes, raceComments
			        FROM       	race
			        WHERE      	raceID = " . $raceID ;
	
			$recordSet = execute_sql($sql);
	
			list($track, $raceDate, $raceNum, $distanceYards, $surface, $raceType, $ageSexRestriction,
							$tdyRaceClassification, $purse, $claimingPrice, $trackRecord, $raceConditions,$simHostTrackCode, 
							$simHostTrackRaceNum, $twoFBrisPaceParForLevel, $fourFBrisPaceParForLevel, $sixFBrisPaceParForLevel, 
							$BrisSpeedParForClassLevel, $BrisLatePaceParForLevel, $drfRaceCondition, $wagerTypes, $raceComments) = $recordSet->fields;
		
		
	        $this->track = $track;
	        $this->raceDate = $raceDate;
	        $this->raceNum = $raceNum;
	        $this->distanceYards = $distanceYards; 
	        $this->surface = $surface; 
	        $this->raceType = $raceType;
	        $this->ageSexRestriction = $ageSexRestriction;
	        $this->tdyRaceClassification = $tdyRaceClassification;
	        $this->purse = $purse;
	        $this->claimingPrice = $claimingPrice;
	        $this->trackRecord = $trackRecord;
	        $this->raceConditions = $raceConditions;
	        $this->tdyLasixList = $tdyLasixList;
	        $this->tdyButeList = $tdyButeList;
	        $this->tdyCoupledList = $tdyCoupledList;
	        $this->tdyMutelList = $tdyMutelList;
	        $this->simHostTrackCode = $simHostTrackCode;
	        $this->twoFBrisPaceParForLevel = $twoFBrisPaceParForLevel;
	        $this->fourFBrisPaceParForLevel = $fourFBrisPaceParForLevel;
	        $this->sixFBrisPaceParForLevel = $sizFBrisPaceParForLevel;
	        $this->BrisSpeedParForClassLevel = $BrisSpeedParForClassLevel;
	        $this->BrisLatePaceParForLevel = $BrisLatePaceParForLevel;        
			$this->drfRaceCondition = $drfRaceCondition; 
			$this->wagerTypes = $wagerTypes; 
			$this->raceComments = $raceComments; 						   
			}
		
	}

	
	function init_race ($entry) {

        $this->track = $entry['track'];
        $this->raceDate = date("Y-m-d", strtotime($entry['raceDate']));
        $this->raceNum = $entry['raceNum'];
        $this->distanceYards = $entry['distanceYards']; 
        $this->surface = $entry['surface']; 
        $this->raceType = $entry['raceType'];
        $this->ageSexRestriction = $entry['ageSexRestriction'];
        $this->tdyRaceClassification = $entry['tdyRaceClassification'];
        $this->purse = $entry['purse'];
        $this->claimingPrice = $entry['claimingPrice'];
        $this->trackRecord = $entry['trackRecord'];
        $this->raceConditions = $entry['raceConditions'];
        $this->tdyLasixList = $entry['tdyLasixList'];
        $this->tdyButeList = $entry['tdyButeList'];
        $this->tdyCoupledList = $entry['tdyCoupledList'];
        $this->tdyMutelList = $entry['tdyMutelList'];
        $this->simHostTrackCode = $entry['simHostTrackCode'];
        $this->twoFBrisPaceParForLevel = $entry['twoFBrisPaceParForLevel'];
        $this->fourFBrisPaceParForLevel = $entry['fourFBrisPaceParForLevel'];
        $this->sixFBrisPaceParForLevel = $entry['sizFBrisPaceParForLevel'];
        $this->BrisSpeedParForClassLevel = $entry['BrisSpeedParForClassLevel'];
        $this->BrisLatePaceParForLevel = $entry['BrisLatePaceParForLevel'];        
		$this->drfRaceCondition = $entry['drfRaceCondition1'] . " " . $entry['drfRaceCondition2'] . " " . $entry['drfRaceCondition3'] . " " . 
								  $entry['drfRaceCondition4'] . " " . $entry['drfRaceCondition5'] . " " . $entry['drfRaceCondition6'] . " "; 
		$this->wagerTypes = $entry['wagerTypes1'] . " " . $entry['wagerTypes2'] . " " . $entry['wagerTypes3'] . " " . 
								  $entry['wagerTypes4'] . " " . $entry['wagerTypes5'] . " " . $entry['wagerTypes6'] . " " . 
								  $entry['wagerTypes7'] . " " . $entry['wagerTypes8'] . " " . $entry['wagerTypes9'] . " "; 						   
        
        
        }


    function save_race () {

        global $conn, $debug;
        //echo "<br> RACE -- DATE = $this->raceDate -- " . date("Y-m-d", $this->raceDate); 
	    //$modRaceDate = date("Y-m-d", $this->raceDate);
	    //echo "<br>RACE FRACTIONALS - " .$this->raceFractionalTimes;
	    
	      
        // add data valaidation
        $sql = "INSERT INTO   race
                        (track, raceDate, raceNum, distanceYards, surface, raceType, ageSexRestriction,
						tdyRaceClassification, purse, claimingPrice, trackRecord, raceConditions, simHostTrackCode, 
						simHostTrackRaceNum, twoFBrisPaceParForLevel, fourFBrisPaceParForLevel, sixFBrisPaceParForLevel, 
						BrisSpeedParForClassLevel, BrisLatePaceParForLevel, drfRaceCondition, wagerTypes, raceComments)
                VALUES
                        ( " . $conn->qstr($this->track) . ",
		                  " . $conn->qstr($this->raceDate) . ",
                          " . $this->raceNum . ",
                          " . $this->distanceYards . ",
                          " . $conn->qstr($this->surface) . ",
                          " . $conn->qstr($this->raceType) . ",
                          " . $conn->qstr($this->ageSexRestriction) . ",
                          " . $conn->qstr($this->tdyRaceClassification) . ",
                          " . $this->purse . ",
                          " . (int)$this->claimingPrice . ",
                          " . (float)$this->trackRecord . ",
                          " . $conn->qstr($this->raceConditions) . ",
                          " . $conn->qstr($this->simHostTrackCode) . ",
                          " . (int)$this->simHostTrackRaceNum . ",
                          " . (int)$this->twoFBrisPaceParForLevel . ",
                          " . (int)$this->fourFBrisPaceParForLevel . ",
                          " . (int)$this->sixFBrisPaceParForLevel . ",
                          " . (int)$this->BrisSpeedParForClassLevel . ",
                          " . (int)$this->BrisLatePaceParForLevel . ",
                          " . $conn->qstr($this->drfRaceCondition) . ",
                          " . $conn->qstr($this->wagerTypes) . ",
                          " . $conn->qstr($this->raceComments) . "
                          )";

        if ($debug) { 
	        echo "<br>SAVE RACE = sql = " . $sql;
        	}	
        $recordSet = execute_sql($sql);

        $ID = $conn->Insert_ID();
        $this->raceID = $ID;
        
        // add the lists
        if ($this->tdyLasixList) { $this->save_list("Lasix"); }
        if ($this->tdyButeList) { $this->save_list("Bute"); } 
        if ($this->tdyCoupledList) {$this->save_list("Coupled"); } 
        if ($this->tdyMutelList) {$this->save_list("Mutel"); } 
      
        
        return $ID;

        }
        
    function save_list($listNameAbbr) {
	    
	    global $conn, $debug;

	    //$listName = "tdy" . $listNameAbbr . "List"; 

		$list = explode(";", $this->$listName);

		for ($i=0; $i<sizeof($list); $i++) {     
	        // add data valaidation
	        $sql = "INSERT INTO   raceList
	                        (raceID, horseName, type)
	                VALUES
	                        ( " . $this->raceID . ",
	                          " . $conn->qstr($list[$i]) . ",
	                          " . $conn->qstr($listNameAbbr) . "
	                          )";
			}
        if ($debug) { 
	        echo "<br>sql = " . $sql;
        	}	
        $recordSet = execute_sql($sql);


    }
    
    function get_entrants($scratched=0) { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 entryID
	    		FROM	 entry
	    		WHERE	 raceID = " . $this->raceID . "
	    		AND		 entry <> 'S'"; 
	    		
	    if ($scratched == 0) { 
	    	$sql .=		" AND		 scratched IS NULL";
    		}	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		return $recordSet;  	
    }  

    
	function init_db() { 
		 
	/*	
		race    CREATE TABLE `race` (                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
          `raceID` int(11) NOT NULL auto_increment,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
          `track` varchar(4) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
          `raceDate` date default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
          `raceNum` int(11) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
          `distanceYards` int(11) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
          `surface` char(2) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
          `raceType` char(2) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
          `ageSexRestriction` char(3) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
          `tdyRaceClassification` varchar(15) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
          `purse` int(11) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
          `claimingPrice` int(11) default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
          `trackRecord` float default NULL,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
          `raceConditions` text,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
          PRIMARY KEY  (`raceID`)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
        ) TYPE=MyISAM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
		*/
        
    }
    function get_score() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 s.ppID, e.horseName, e.programNumber, "; 
	    for ($i=0; $i<sizeof($this->score_fields); $i++) { 
		    $sql .= $this->score_fields[$i] . ", ";  
	    	}
	    
		$sql = substr("$sql", 0, -2);
		 	
	    $sql .="
	    			
	    		FROM	 score as s, pp as p, entry as e
	    		WHERE	 s.raceID = " . $this->raceID . "
	    		AND		 s.ppId = p.ppID
	    		AND		 p.entryID = e.entryID
	    		ORDER BY	e.entryID";	
	    
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
 		return $recordSet; 
	
    }
    
    function clearRaceSelectedPacelines() { 
		
	    global $conn, $debug; 
	    
	    $sql = "
				update 		pp, entry
				set 		pp.selected = 0
				where		entry.raceID = " . $this->raceID . "
				and			entry.entryID = pp.entryID
	    		";	
	    
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
 		return $recordSet; 
 		    
	    
    }
    
    function clearRaceScratches() { 
		
	    global $conn, $debug; 
	    
	    $sql = "
				update 		entry
				set 		scratched = NULL
				where		entry.raceID = " . $this->raceID;	
	    
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
 		return $recordSet; 
 		    
	    
    }

    function get_recent_races($numRace=20) { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 raceID, track, raceNum, raceDate, surface, distanceYards
	    		FROM	 race
	    		ORDER BY raceID DESC
	    		LIMIT	 0, " . $numRace;	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		return $recordSet;  	
    }  
  
    function save_pick($arrPick) {
	    
	    global $conn, $debug;

	    //$listName = "tdy" . $listNameAbbr . "List"; 
		$sql = "	DELETE FROM		picks
					WHERE			raceID = " . $this->raceID;
       	$recordSet = execute_sql($sql);
					
		for ($i=0; $i<sizeof($arrPick); $i++) {
			
	       	$sql = "INSERT INTO   picks
		                        (raceID, entryID, position)
		                VALUES
		                        ( " . $this->raceID . ",
		                          " . $arrPick[$i][0] . ",
		                          " . $arrPick[$i][1] . "
		                          )";
						
	        if ($debug) { 
		        echo "<br>sql = " . $sql;
	        	}	
	        $recordSet = execute_sql($sql);
		}

    }


    function save_wager($arrWager) {
	    
	    global $conn, $debug;
	    //show_array($arrWager); 

	    //$listName = "tdy" . $listNameAbbr . "List"; 
		$sql = "	UPDATE			entry
					SET				wager = null
					WHERE			raceID = " . $this->raceID;
       	$recordSet = execute_sql($sql);
					
		for ($i=0; $i<sizeof($arrWager); $i++) {
			
	       	$sql = "UPDATE   		entry
					SET				wager = " . $arrWager[$i][1] . "
					WHERE			entryID = " . $arrWager[$i][0]
					;
						
	        if ($debug) { 
		        echo "<br>sql = " . $sql;
	        	}	
	        $recordSet = execute_sql($sql);
		}

    }

    function save_payout($arrPayout) {
	    
	    global $conn, $debug;

	    //show_array($arrPayout); 
	    //$listName = "tdy" . $listNameAbbr . "List"; 
		$sql = "	UPDATE			entry
					SET				payout = null
					WHERE			raceID = " . $this->raceID;
       	$recordSet = execute_sql($sql);
					
		for ($i=0; $i<sizeof($arrPayout); $i++) {
			
	       	$sql = "UPDATE   		entry
					SET				payout = " . $arrPayout[$i][1] . "
					WHERE			entryID = " . $arrPayout[$i][0]
					;
						
	        if ($debug) { 
		        echo "<br>sql = " . $sql;
	        	}	
	        $recordSet = execute_sql($sql);
		}

    }
    
    function save_raceComments($raceComments) {
	    
	    global $conn, $debug;
	    
	    $this->raceComments = $raceComments; 

		$sql = "	UPDATE			race
					SET				raceComments = " . $conn->qstr($this->raceComments) . "
					WHERE			raceID = " . $this->raceID;
					

        if ($debug) { 
	        echo "<br>sql = " . $sql;
        	}	
        $recordSet = execute_sql($sql);
	
    }

    function check_pacelines_selected() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 p.ppID	    		
	    		FROM	 pp as p, entry as e
	    		WHERE	 e.raceID = " . $this->raceID . "
	    		AND		 p.entryID = e.entryID
	    		AND		 p.selected = 1";	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		return $recordSet->RowCount();  	
    }  
    
    
    function pacelines_selected() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 p.ppID	    		
	    		FROM	 pp as p, entry as e
	    		WHERE	 e.raceID = " . $this->raceID . "
	    		AND		 p.entryID = e.entryID
	    		AND		 p.selected = 1";	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		while (!$recordSet->EOF) {
	   		$paceLine[] = $recordSet->fields['ppID'];
	   		$recordSet->MoveNext(); 
   			}
		
		return $paceLine;  	
    }   


    function getRacesOnCard() { 
	    
	    global $conn, $debug; 
	    
	    $sql = "SELECT 	 raceID
	    		FROM	 race
	    		WHERE	 track = " . $conn->qstr($this->track) . "
	    		AND		 raceDate = " . $conn->qstr($this->raceDate) . "
	    		ORDER BY raceID ASC";	
	    //echo $sql; 
	    $recordSet = execute_sql($sql);
	   	while (!$recordSet->EOF) {
		   	$arrRace[] = $recordSet->fields['raceID']; 
		   	$recordSet->MoveNext();
	   		}
    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		return $arrRace;  	
    }      
    
} 