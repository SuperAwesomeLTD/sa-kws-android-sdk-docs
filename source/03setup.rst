Setup the SDK
=============

In order to work properly, the SDK must be initialized with a number of parameters:

 * OAuth Token: the current secret token for the current registered user
 * KWS API URL: the API backend to connect to in order to perform all operations
 * GCM Sender: the unique CGM sender parameter
 * Delegate: a class / object that acts as listener for the KWSInterface

The three parameters can be conveniently set by using the **setup** function:

.. code-block:: java

    // get setup variables
    String token = "__CURRENT_VALID_OAUTH_TOKEN__";
    String url = "__KWS_API_BACKEND_URL__";
    String gcm = "__APP_GCM_STRING__"

    // get application context
    KWS.sdk.setApplicationContext(getApplicationContext());

    // setup SDK
    KWS.sdk.setup(token, url, gcm, this);

Also, the class that acts as a listener of **KWSInterface** must implement the following methods:

.. code-block:: java

    public class MainActivity extends Activity implements KWSInterface  {

        @Override
        public void isAllowedToRegisterForRemoteNotifications() {

        }

        @Override
        public void isAlreadyRegisteredForRemoteNotifications() {

        }

        @Override
        public void didRegisterForRemoteNotifications() {

        }

        @Override
        public void didFailBecauseKWSDoesNotAllowRemoteNotifications() {

        }

        @Override
        public void didFailBecauseKWSCouldNotFindParentEmail() {

        }

        @Override
        public void didFailBecauseRemoteNotificationsAreDisabled() {

        }

        @Override
        public void didFailBecauseOfError() {

        }
    }


Once this is achieved, you've correctly setup the Kids Web Services Android SDK.
