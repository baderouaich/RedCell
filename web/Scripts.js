/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


///===================== JQuery script to hide any  message spawned after 10 seconds the page is loaded =====================///
const ALERT_MESSAGE_LIFE_TIME = 10 * 1000; // 10 seconds
$(document).ready(function()
{
    setTimeout(function()
    {
       $(".message-info, .message-error, .message-warn").each(function()
       {
           $(this).fadeOut(); // or hide(); with no animation.
       });
    }, ALERT_MESSAGE_LIFE_TIME);
});
///======================================================================================================================///