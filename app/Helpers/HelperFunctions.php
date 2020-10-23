<?php

	function sortByOrder($a, $b) {
        return $a->id - $b->id;
    }

    function getBetween($content,$start,$end){
	    $r = explode($start, $content);
	    if (isset($r[1])){
	        $r = explode($end, $r[1]);
	        return $r[0];
	    }
	    return '';
	}

	function getRoleFullName($RoleAbrv){
		$RoleDetails['RoleFullName'] = "Not Assinged";
		$RoleDetails['RoleDescription'] = "Not Assinged";

	    if($RoleAbrv == 'CAD'){
	    	$RoleDetails['RoleFullName'] = 'Application Administrator';
	    	$RoleDetails['RoleDescription'] = 'Application Administrator';
	    	$RoleDescription = 'Application Administrator';
	    }
	    
	    if($RoleAbrv == 'PRO'){
	    	$RoleDetails['RoleFullName'] = 'Purchase Enquiry Originator';
	    	$RoleDetails['RoleDescription'] = 'The Purchase Enquiry Originator(s) will be tasked with creating multiline Purchase Enquiries for the Set-up which are assigned to them. On Ogéo, creating a Purchase Enquiry, which can be created for either Materials or Services, sets in motion the process of procurement.';
	    }

	    if($RoleAbrv == 'PRV'){
	    	$RoleDetails['RoleFullName'] = 'Purchase Enquiry Validator';
	    	$RoleDetails['RoleDescription'] = 'The Purchase Enquiry Validator(s) will be tasked with ruling on (approving/rejecting) the multiline Purchase Enquiries originated, for the Set-up, by the employees holding the Purchase Enquiry Originator role. The Purchase Enquiry Validator(s) are assigned Purchase Enquiries to rule on according to the Delegation of Authority that apply to the Set-up.';
	    }

	    if($RoleAbrv == 'RFQM'){
	    	$RoleDetails['RoleFullName'] = 'Request for Proposals Administrator';
	    	$RoleDetails['RoleDescription'] = '<p>The Request for Proposals Administrator(s) will be tasked with creating multiline Requests for Proposals. The employees holding this role will be responsible for publishing the Request for Proposal to the selected bidding vendors, so that they can submit their offers to the organization on Ogéo. For the sake of governance, the Requests for Proposals" are solely created on the back of:</p>
	    			<ol>
						<li>Approved Purchase Enquiries; or</li>
						<li>Approved Rate Contract Requests</li>
					</ol>
			';
	    }

	    if($RoleAbrv == 'POO'){
	    	$RoleDetails['RoleFullName'] = 'Purchase Order Originator';
	    	$RoleDetails['RoleDescription'] = 'Purchase Order Originator';
	    }

	    if($RoleAbrv == 'POV'){
	    	$RoleDetails['RoleFullName'] = 'Purchase Order Validator';
	    	$RoleDetails['RoleDescription'] = 'Purchase Order Validator';
	    }

	    if($RoleAbrv == 'RNO'){
	    	$RoleDetails['RoleFullName'] = 'Receipt Note Originator';
	    	$RoleDetails['RoleDescription'] = 'Receipt Note Originator';
	    }

	    if($RoleAbrv == 'RNV'){
	    	$RoleDetails['RoleFullName'] = 'Receipt Note Validator';
	    	$RoleDetails['RoleDescription'] = 'Receipt Note Validator';
	    }

	    if($RoleAbrv == 'SLM'){
	    	$RoleDetails['RoleFullName'] = 'Vendors Qualification Administrator';
	    	$RoleDetails['RoleDescription'] = 'Vendors Qualification Administrator';
	    }

	    if($RoleAbrv == 'INV'){
	    	$RoleDetails['RoleFullName'] = 'Invoice Checker';
	    	$RoleDetails['RoleDescription'] = 'Invoice Checker';
	    }

	    if($RoleAbrv == 'ALMR'){
	    	$RoleDetails['RoleFullName'] = 'Library of Material Update Request Originator';
	    	$RoleDetails['RoleDescription'] = 'Library of Material Update Request Originator';
	    }

	    if($RoleAbrv == 'LMA'){
	    	$RoleDetails['RoleFullName'] = 'Library of Materials Administrator';
	    	$RoleDetails['RoleDescription'] = 'Library of Materials Administrator';
	    }

	    if($RoleAbrv == 'ALMV'){
	    	$RoleDetails['RoleFullName'] = 'Library of Materials Validator';
	    	$RoleDetails['RoleDescription'] = 'Library of Materials Validator';
	    }

	    if($RoleAbrv == 'RCCO'){
	    	$RoleDetails['RoleFullName'] = 'Rate Contract Creation Request Originator';
	    	$RoleDetails['RoleDescription'] = 'Rate Contract Creation Request Originator';
	    }

	    if($RoleAbrv == 'RCCV'){
	    	$RoleDetails['RoleFullName'] = 'Rate Contract Creation Request Validator';
	    	$RoleDetails['RoleDescription'] = 'Rate Contract Creation Request Validator';
	    }

	    if($RoleAbrv == 'RCO'){
	    	$RoleDetails['RoleFullName'] = 'Rate Contract Originator';
	    	$RoleDetails['RoleDescription'] = 'Rate Contract Originator';
	    }

	    if($RoleAbrv == 'RCV'){
	    	$RoleDetails['RoleFullName'] = 'Rate Contract Validator';
	    	$RoleDetails['RoleDescription'] = 'Rate Contract Validator';
	    }

	    if($RoleAbrv == 'SIIRPT'){
	    	$RoleDetails['RoleFullName'] = 'Storeroom In-Charge';
	    	$RoleDetails['RoleDescription'] = 'Storeroom In-Charge';
	    }

	    if($RoleAbrv == 'ASTMGR'){
	    	$RoleDetails['RoleFullName'] = 'Storeroom Manager';
	    	$RoleDetails['RoleDescription'] = 'Storeroom Manager';
	    }

	    if($RoleAbrv == 'RTIRS'){
	    	$RoleDetails['RoleFullName'] = 'Storeroom Transaction Request Originator';
	    	$RoleDetails['RoleDescription'] = 'Storeroom Transaction Request Originator';
	    }

	    if($RoleAbrv == 'ATSIRS'){
	    	$RoleDetails['RoleFullName'] = 'Storeroom Transaction Request Validator';
	    	$RoleDetails['RoleDescription'] = 'Storeroom Transaction Request Validator';
	    }

	    if($RoleAbrv == 'RTSI'){
	    	$RoleDetails['RoleFullName'] = 'Storeroom Items Update Request Originator';
	    	$RoleDetails['RoleDescription'] = 'Storeroom Items Update Request Originator';
	    }

	    if($RoleAbrv == 'ATSI'){
	    	$RoleDetails['RoleFullName'] = 'Storeroom Items Update Request Validator';
	    	$RoleDetails['RoleDescription'] = 'Storeroom Items Update Request Validator';
	    }

	    return $RoleDetails;
	}