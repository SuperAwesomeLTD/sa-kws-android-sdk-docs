Start a new KWS session
=======================

In order to be able to use the Kids Web Services SDK you'll first have to setup a session.

A session is defined by

	* a client ID
	* an app ID
	* a client Secret
	* a back-end API URL to connect to

To set it up you will have to call:

.. code-block:: java

  private static final String CLIENT_ID     @"id"
  private static final int    APP_ID        30303
	private static final String CLIENT_SECRET @"client_secret"
  private static final String API           @"kws_api"


  KWS.sdk.startSession (CLIENT_ID, APP_ID, CLIENT_SECRET, API);

You can obtain the Client Id, App Id, Client Secret and API host from the **Integration** section of your Kids Web Services Control Panel.

They should be different for each app you have.

.. image:: img/kws-integration.png

Once you've setup your SDK session, it's time to authenticate as a user. All of of the functionality of the SDK assumes you're
logged in as a user.
