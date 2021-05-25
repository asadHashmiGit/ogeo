<?php

namespace App\Http\Controllers;

use App\User;
use App\Recommend;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use DB;
use Illuminate\Support\Facades\Mail;
use App\Mail\ReferralMail;
use App\Mail\ReferralMailReturnUser;

class RecommendController extends Controller
{
    public function add_recommend(Request $request){
     
       DB::beginTransaction();

        try {

       $check=User::where('email',$request->email)->first();
       if($check){
            return response()->json(['status'=>false,'message'=>'User is already Registered with this email']);
       }else{
           
        $recommend=new Recommend();
        $recommend->name=$request->name;
        $recommend->email=$request->email;
        $recommend->description=$request->description;
        $recommend->ref_id=$request->ref_id;
        $recommend->save();

        $user=User::find($request->ref_id);
        //  return $user; 
        $link=url('/registration?ref_id='.$user->id);

        $to = $request->email;
        //  $subject = "Invitation from Ogeo";
        //  $txt = "Hi ".$request->name."\n You are invited to join Ogeo from ".$user->name."\n";
        //  $txt =$txt."You can join Ogeo By using this link: ";
        //  $headers = "From: no-reply@ogeo.com" . "\r\n" .
        //  "CC: no-reply@ogeo.com";
         
        //  mail($to,$subject,$txt,$headers);

        Mail::to($to)->send(new ReferralMail($user, $recommend, $link));
        Mail::to($user->email)->send(new ReferralMailReturnUser($user, $recommend, $link));
        
        DB::commit();
            return response()->json(['status'=>true,'message'=>'Recommendation added']);
      
        }
     
       // all good
    } catch (\Exception $e) {
        DB::rollback();
        return response()->json(['status'=>false,'message'=>$e->getMessage()]);
    }


    }
}
