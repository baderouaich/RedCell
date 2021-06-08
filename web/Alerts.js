/**
    Document   : Alerts
    Created on : Jun 5, 2021, 9:30:25 PM
    Author     : bader
**/

"use strict";


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


