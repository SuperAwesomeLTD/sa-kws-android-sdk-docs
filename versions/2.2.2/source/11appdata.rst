App data
========

For each user registered on an app in the Kids Web Services Control Panel you can add custom String-Integer pairs of App Data.

You can add a pair of such data for the user you're authenticated as by calling:

.. code-block:: java

  KWS.sdk.setAppData (MainActivity.this, "app-data", 15, new KWSSetAppDataInterface() {
    @Override
    public void setAppData (boolean success) {
      // handle success
    }
  });

The method has the following parameters:

======= ======= ======
Value   Type    Meaning
======= ======= ======
name    String  the key of the pair
value   Integer the value associated with the key
======= ======= ======

The callback will pass the following value on completion:

======= ==== ======
Value   Type Meaning
======= ==== ======
success Bool whether the network operation was successful
======= ==== ======

.. note::

  Please note the fact that app data pairs can only by String-Integer. This is in order to further protect users.

If on the other hand you want to get the app data for the user you're authenticated as you can call:

.. code-block:: java

  KWS.sdk.getAppData (MainActivity, new KWSGetAppDataInterface() {
    @Override
    public void gotAppData (List<KWSAppData*> *appData) {
      // handle app data
	  }
  });

The callback will pass the following value on completion:

======= =================== ======
Value   Type                Meaning
======= =================== ======
appData Array of KWSAppData An array of KWSAppData objects
======= =================== ======

The **KWSAppData** object contains the following fields:

===== ======= =======
Field Type    Meaning
===== ======= =======
name  String  The name key of the App Data pair
value Integer The value of the App Data pair
===== ======= =======
