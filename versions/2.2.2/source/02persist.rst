Persisting the user
===================

Once a user is either created or authenticated, KWS will keep the user for 24 hours in user preferences or system defaults.

You can access the basic logged user details by calling:

.. code-block:: java

  KWSLoggedUser currentUser = KWS.sdk.getLoggedUser ();

The **KWSLoggedUser** object has the following fields:

====================== ===================== =======
Field                  Type                  Meaning
====================== ===================== =======
token                  String                OAuth access token
metadata               KWSMetadata           Metadata object
====================== ===================== =======

The **KWSMetadata** object has the following fields:

======== ======= =======
Field    Type    Meaning
======== ======= =======
userId   Integer Unique Id of the user
appId    Integer App Id the user is logged on
clientId String  Client Id of the app
scope    String  Current scope
iat      Integer Date of start (in milliseconds)
exp      Integer Date of expiration (in milliseconds)
======== ======= =======
