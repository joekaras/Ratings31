<?

/*
  HandicappingOS, Open Source Handicapping Solutions
  http://www.handicappingOS

  Copyright (c) 2005 Richard Rosa

  Released under the GNU General Public License
*/

	function sort_ranks(&$calcs, $sortField, $rankField) { 
		
		for ($i=0; $i<sizeof($calcs); $i++) {
			$rankFld[] = $calcs[$i][$sortField]; 
			}
		//show_array($rankFld); 
		
		if ($rankField == "TotalPrimeRank") { 
			//echo "<h1>OK</h1>";
			asort($rankFld);  // less is better
			}
		else { 
			arsort($rankFld); // more is better
			}
		$i = 1; 
		while (list($rank, $b) = each($rankFld)) {
	    	$calcs[$rank][$rankField] = $i; 
			$i++; 
	    	}
	    //show_array($calcs);	
	}
	
	function convert_race_time ($oldTime) { 
		
		$minutes = floor($oldTime / 60);
		$seconds = $oldTime - ($minutes * 60);
		if ($minutes > 0) { 
			$newTime = $minutes . ":" . sprintf("%02.1f" , $seconds);
			//sprintf("%03d",$x); 
			}
		else { 
			$newTime = ":" . sprintf("%01.01f" , $seconds);
			}
		return $newTime;
		}
		
		
	function get_current_odds ($track, $race) { 
		
		if (strlen($track) == 2) { 
			$track .= "X"; 
			} 
		
		$url = "http://www.tsnhorse.com/cgi-bin/totedb/odds.cgi?tracks=" . $track . "::::&types=0::::";
		//echo $url; 
		$readData = getURL($url);
		//echo $readData; 
		preg_match('/<TD CLASS=track>/i', $readData, $result, PREG_OFFSET_CAPTURE);
        // decrease the string
        $readData = substr ($readData, $result[0][1]);
        //echo $readData;
        $entries = preg_split("/<B>/", $readData);
        
        for ($i=0; $i<sizeof($entries); $i++) { 
	        $indvEntry = preg_split("/<\/B>/", $entries[$i]);
	        //show_array($indvEntry);
        	$toteEntry[] = $indvEntry[0]; 
        	}
        
        return($toteEntry);

	}
	
	function get_old_odds ($track, $raceNum, $raceDate) { 
		
		global $debug, $db_hostname, $db_user, $db_password, $chart_database, $db_database;
	    
	    $chartconn = &ADONewConnection($db_databaseType);    # create a connection
    	if (!$chartconn->PConnect($db_hostname, $db_user, $db_password, $chart_database))
       		die("Cannot connect to " . $chart_database); 
	    
	    $sql = "select 		e.program, e.odds 
	    		from 		entry as e, race as r, trackabbr as t 
	    		where 		t.abbr = " . $chartconn->qstr($track) . "
				and 		r.racedate = " . $chartconn->qstr($raceDate) . "
				and 		r.raceNum = $raceNum
				and			t.name = r.track
				and 		e.raceID = r.raceID 
				order 		by program";	
	    //echo $sql; 
   		$oddsSet = &$chartconn->Execute($sql);
   		
   		while (!$oddsSet->EOF) {
	   		$oddsLine[$oddsSet->fields['program'] + 4] = $oddsSet->fields['odds']; 
	   		$oddsSet->MoveNext();
   			}

    	//show_array($recordSet->fields); 
		//show_array($recordSet);
				
		// reset the connection, flaw in ADODB
		$conn = &ADONewConnection($db_databaseType);    # create a connection
    	if (!$conn->PConnect($db_hostname, $db_user, $db_password, $db_database))
       		die("Cannot connect to " . $db_database);
    
		return $oddsLine;  	
		
		
	}
		
		
		
	function get_current_conditions ($track, $race) { 
		
		if (strlen($track) == 2) { 
			$track .= "X"; 
			} 
		
		$url = "http://www.tsnhorse.com/cgi-bin/totedb/scratches_tracks.cgi?track=" . $track . "&type=0";
		//echo $url; 
		$readData = getURL($url);
		//echo $readData; 
		
		preg_match('/(Track Conditions: <FONT COLOR=#FFFFFF>)(.*)(<\/FONT><\/FONT>)/i', $readData, $result);
		//preg_match('/<b>.*<\/b>/i', $string, $result); 
		
		//show_array ($result); 
		return $result[2]; 
	}
	
	function get_current_exacta ($track, $race) { 
		
		if (strlen($track) == 2) { 
			$track .= "X"; 
			} 
		
		$url = "http://www.tsnhorse.com/cgi-bin/totedb/probables.cgi?track=" . $track . "&type=EX&trackType=0";
		$readData = getURL($url);
		$readData = str_replace("CONTENT=\"60;", "CONTENT=\"60000;", $readData); 
		
		
		// uncomment to activate DailyDouble
		$url = "http://www.tsnhorse.com/cgi-bin/totedb/probables.cgi?track=" . $track . "&type=DD&trackType=0";
		//$readData .= getURL($url);
		
		return $readData; 
	}
	

			
	function fixProgNum($progNum) { 
		
		if (!(is_int($progNum))) {
			$progNum = trim($progNum); 
			}
		return $progNum; 
		
		}
		
	function fixOddsDisplay($odds) { 
		
		//(int) $odds; 
		//echo "<br><h1>ODDS = $odds </h1>"; 
		if (!(strstr($odds, '/'))) {
			if ($odds) {
				$odds = $odds . "/1"; 
				}
			}
		return $odds; 
		
		}
	
	function convertOddsFromRawScore ($rawScore, $adjust=0) {
				
 		//echo "<br>Raw = $rawScore";
		$rawScore = 1 / $rawScore;
		$rawScore = $rawScore - $adjust; 
		//echo "<br>$rawScore " . (int)($rawScore*2) % 2; 
		if ($rawScore < 2) {
			 $odds = (int)($rawScore * 5) . "/5"; 
		 	}
		elseif (($rawScore < 5) && ($rawScore > (int)$rawScore) && (((int)($rawScore*2) % 2) == 1)) {
			 $odds = (int)($rawScore * 2) . "/2"; 
			}						 
		 else { 
			 $odds = (int)$rawScore . "/1"; 
		 	}
 		//echo "<br>Odds = $odds";
		return $odds; 
	 	}
	
    function get_chartURL($track, $raceDate, $raceNum) { 
	    
	    global $debug, $db_hostname, $db_user, $db_password, $chart_database;
	    
	    $chartconn = &ADONewConnection($db_databaseType);    # create a connection
    	if (!$chartconn->PConnect($db_hostname, $db_user, $db_password, $chart_database))
       		die("Cannot connect to " . $chart_database); 
	    
	    $sql = "SELECT 	 	raceDetail
	    		FROM		raceDetail as r, trackabbr as t
	    		WHERE		r.raceDate = " . $chartconn->qstr($raceDate) . "
	    		AND			t.name = r.track
	    		AND			t.abbr = " . $chartconn->qstr($track) . "
	    		AND			r.raceNum = " . $raceNum;	
	    //echo $sql; 
   		$recordSet = &$chartconn->Execute($sql);

    	//show_array($recordSet->fields); 
		//show_array($recordSet);
		return $recordSet->fields[0];  	
    }   
	
    function display_timestamp () {
	    $t_start = array_sum(explode(' ', microtime()));
		//$exec_time = array_sum(explode(' ', microtime())) - $t_start;
		//echo ("Execution time is $exec_time seconds.");	    

	    echo "<br>time is = $t_start"; ;   		
		}
 
	function getURL ($dataSource) {

		if ( (startsWith($dataSource, 'http://')) || (startsWith($dataSource, 'https://')) ) {
    		//echo "<br>datasource = $dataSource";
            $ch = curl_init($dataSource);
    		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    		//curl_setopt($ch, CURLOPT_REFERER, "https://www.ebetusa.com/components/probables/top.jsp?raceday=20050901&trackCodePad=PENX&trackName=Penn+National&raceNumber=1"); 
    		curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)");
    		$readData = curl_exec($ch);
    		curl_close($ch);
 
    		if($debug) echo "!!".strlen($this->dataSource)."!";
            if($debug) echo "\n<br>Curl -> '$dataSource'\n";
            if($debug) echo "\n<br>Result -> '".$this->dataSource."'\n";
	        }
        else {
       		$fd = fopen($dataSource, "r");
    		do
    		{
    			$tmp = fread($fd, MAX_DATASOURCE_SIZE);
    			$readData .= $tmp;
    		}
    		while(strlen($tmp) >0);
    		fclose($fd);
	        }

	    if (strstr($readData, "Scroll to race")) {
	    	logChartURL($dataSource, $readData);
    		echo "<br>Stored - $dataSource"; 
	    	}
	    return $readData;
        }
		   
		
	?>