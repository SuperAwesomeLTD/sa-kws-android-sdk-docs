Example
=======

.. code-block:: java

    import android.support.v7.app.AppCompatActivity;
    import android.os.Bundle;
    import android.util.Log;
    import kws.superawesome.tv.*;

    public class MainActivity extends AppCompatActivity implements KWSInterface {

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_main);

            // get setup variables
            String token = "__CURRENT_VALID_OAUTH_TOKEN__";
            String url = "__KWS_API_BACKEND_URL__";
            String gcm = "__APP_GCM_STRING__"

            // get application context
            KWS.sdk.setApplicationContext(getApplicationContext());

            // setup SDK
            KWS.sdk.setup(token, url, gcm, this);
            KWS.sdk.checkIfNotificationsAreAllowed();
        }

        @Override
        public void isAllowedToRegisterForRemoteNotifications() {
            // if the SDK checkup determines the user is allowed to receive
            // remote notifications - then register the user!
            KWS.sdk.registerForRemoteNotifications();
        }

        @Override
        public void isAlreadyRegisteredForRemoteNotifications() {
            Log.d("SuperAwesome", "User is already registered for remote notifications");
        }

        @Override
        public void didRegisterForRemoteNotifications() {
            Log.d("SuperAwesome", "User successfully registered for remote notifications");
        }

        @Override
        public void didFailBecauseKWSDoesNotAllowRemoteNotifications() {
            Log.d("SuperAwesome", "User could not register because KWS does not allow it");
        }

        @Override
        public void didFailBecauseKWSCouldNotFindParentEmail() {
            String email = "example@parent.com";
            KWS.sdk.submitParentEmail(email);
        }

        @Override
        public void didFailBecauseRemoteNotificationsAreDisabled() {
            Log.d("SuperAwesome", "User could not register because remote notifications are disabled");
        }

        @Override
        public void didFailBecauseOfError() {
            Log.d("SuperAwesome", "User could not register because of misc error");
        }
    }
