using PubNubMessaging.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TelerikHackaton.Ruler.Services.PushService
{
    public class PushNotifier
    {
        // The application in PubNub (change them with the ones of a new application if u must, no settings other then here need to be set)
        private static readonly string PUBLISH_KEY = "pub-c-621d091b-52eb-4164-80da-189ca20da66f";
        private static readonly string SUBSCRIBE_KEY ="sub-c-584d5144-4865-11e3-a44d-02ee2ddab7fe";
        private static readonly string SECRET_KEY = "sec-c-OTQ1NTRiZjAtMTc2Ni00MjAxLWFmZTctOGY5MGJhNmFjNTVi";

        private static PushNotifier notifier;

        protected PushNotifier()
        {
        }

        public static PushNotifier GetInstance()
        {
            if (notifier == null)
            {
                notifier = new PushNotifier();
            }

            return notifier;
        }

        public void Push(string data, string channelName)
        {
            Pubnub pusher = new Pubnub(PUBLISH_KEY, SUBSCRIBE_KEY, SECRET_KEY);

            pusher.Publish(channelName, data, Success, Error);
        }

        private void Success(object data)
        {

        }

        private void Error(object data)
        {

        }
    }


}