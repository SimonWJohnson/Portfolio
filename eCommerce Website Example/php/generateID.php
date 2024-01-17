<?php
    // Generate a random alphanumeric ID of a specified length
    // $length parameter determines the length of the generated ID
    function gen_ID($length)
    {
      $id = 0; // Accumulates the characters of the generated ID
        //$id = ""; // Accumulates the characters of the generated ID
      $chars = "012345678936792572378883256937"; // String of available characters

        for($i = 0; $i < $length; $i++)
        {
           $x = rand(0, strlen($chars) -1); // generates a random index within the range
           $id.= $chars[$x]; // appends the character at the randomly chosen index $x of the $chars string to the $id string
        }

        return $id.time(); // returns the generated ID with a timestamp
    }



    
   // function gen_ID($length) {
       // $id = 0;
     //   $chars = "012345678936792572378883256937";
        //$chars = "0123456789";
      //  for($i = 0; $i < $length; $i++) {
      //    $x = mt_rand(0, strlen($chars) -1);
      //    $id.= $chars[$x];
      //  }
       // return $id.time();
      //}

      //function gen_ID($length) {
          //$nums = '0123456789';
         // First number shouldn't be zero    
         //$out = $nums[mt_rand( 1, strlen($nums)-1 )];     
         // Add random numbers to your string    
         //for ($p = 0; $p < $length-1; $p++)
         //{
          //  $out .= $nums[mt_rand( 0, strlen($nums)-1 )];
        // }
         // return $out.time();
      //}

?>