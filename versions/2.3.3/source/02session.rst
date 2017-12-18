Initialise the SDK
==================

In order to be able to use the Kids Web Services SDK you'll first have to initialise it with the following values:

	* a client ID
	* a mobile client Secret
	* a back-end API URL to connect to

To set it up you will have to call:

.. code-block:: java

  private static final String CLIENT_ID     @"id"
  private static final String CLIENT_SECRET @"client_secret"
  private static final String API           @"kws_api"


  KWSChildren.sdk.setup (MainActivity.this, CLIENT_ID, CLIENT_SECRET, API);

You can obtain the Client Id, Mobile Client Secret and API host from the **Integration** section of your Kids Web Services Control Panel.

They should be different for each app you have.

.. image:: img/kws-integration.png

Once you've initialised the SDK, it's time to authenticate as a user. All of of the functionality of the SDK assumes you're
logged in as a user.
