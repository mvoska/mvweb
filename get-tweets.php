<?php
session_start();
require_once("twitteroauth/twitteroauth/twitteroauth.php"); //Path to twitteroauth library
 
$twitteruser = "mattvoska";
$notweets = 30;
$consumerkey = "7JQURGunM1TaBqtgKdUA5w";
$consumersecret = "GpDGUBhS7hnObGU8Gfq47DWCqUFysmBKFtudaebf3U";
$accesstoken = "1199392056-aXVdb8gkXcBI47cXCGYXYaUVntpdtmdVlzAv8ZB";
$accesstokensecret = "3CvrL31cjWN7yZQNMnA3IilRXU2ixyk3vtUlPocpMBA";
 
function getConnectionWithAccessToken($cons_key, $cons_secret, $oauth_token, $oauth_token_secret) {
  $connection = new TwitterOAuth($cons_key, $cons_secret, $oauth_token, $oauth_token_secret);
  return $connection;
}
  
$connection = getConnectionWithAccessToken($consumerkey, $consumersecret, $accesstoken, $accesstokensecret);
 
$tweets = $connection->get("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=".$twitteruser."&count=".$notweets);
 
echo json_encode($tweets);
?>
