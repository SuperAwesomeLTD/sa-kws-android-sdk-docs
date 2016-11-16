Persisting the user
===================

Once a user is either created or authenticated, KWS will keep the user for 24 hours in user preferences or system defaults.

You can access the basic logged user details by calling:

.. code-block:: java

  KWSLoggedUser currentUser = KWS.sdk.getLoggedUser ();

The **KWSUser** object has the following fields:

====================== ===================== =======
Field                  Type                  Meaning
====================== ===================== =======
id                     Integer               Unique Id of the user
username               String                Username for this app only
dateOfBirth            String                Date of birth of user
country                String                Two letter country designation
parentEmail            String                Users' parent email
accessToken            String                OAuth access token
token                  String                OAuth final token
expiresIn              Integer               Milliseconds till expiration
loginDate              Long                  Last login date
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
iat      Integer
exp      Integer Date of expiration (in milliseconds)
iss      Integer
======== ======= =======
