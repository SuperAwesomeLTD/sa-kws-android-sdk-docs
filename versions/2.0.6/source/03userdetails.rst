Get user details
================

To obtain information on the user you're authenticated as you'll need to call:

.. code-block:: java

  KWS.sdk.getUser (MainActivity, new KWSGetUserInterface(){
    @Overwrite
    void getUser (KWSUser user) {
      // handle user data
    }
  });

The callback will pass the following values on completion:

======= ======= ======
Value   Type    Meaning
======= ======= ======
user    KWSUser If non-null, the SDK was able to retrieve information about a user
======= ======= ======

The **KWSUser** object has the following fields:

====================== ===================== =======
Field                  Type                  Meaning
====================== ===================== =======
id                     Integer               Unique Id of the user
username               String                Username for this app only
firstName              String                First name of user
lastName               String                Last name of user
dateOfBirth            String                Date of birth of user
gender                 String                Either 'm' or 'f'
phoneNumber            String                Formatted phone number
language               String                Two letter country code
email                  String                User email
address                KWSAddress            Address object
points                 KWSPoints             Points object
applicationPermissions KWSPermissions        Available permissions object
applicationProfile     KWSApplicationProfile Application profile object
====================== ===================== =======

The **KWSAddress** object has the following fields:

======== ====== =======
Field    Type   Meaning
======== ====== =======
street   String Street address of user
city     String City of user
postCode String Postal Code of user
country  String Country of user
======== ====== =======

The **KWSPoints** object has the following fields:

=============================== ======= =======
Field                           Type    Meaning
=============================== ======= =======
pending                         Integer Points that have yet to be approved
totalReceived                   Integer Total points actually received
total                           Integer Total received + Pending
totalPointsReceivedInCurrentApp Integer Points received in this app
availableBalance                Integer Available balance
=============================== ======= =======

The **KWSPermissions** object has the following fields:

===================== ==== =======
Field                 Type Meaning
===================== ==== =======
accessAddress         Bool If the user's parent allows your app to access user's address
accessPhoneNumber     Bool If the user's parent allows your app to access user's phone number
accessFirstName       Bool If the user's parent allows your app to access user's first name
accessLastName        Bool If the user's parent allows your app to access user's last name
accessEmail           Bool If the user's parent allows your app to access user's email address
accessStreetAddress   Bool If the user's parent allows your app to access user's street address
accessPostalCode      Bool If the user's parent allows your app to access user's postal code
accessCountry         Bool If the user's parent allows your app to access user's country
sendPushNotifications Bool If the user's parent allows your app to send push notifications
sendNewsletter        Bool If the user's parent allows your app to send newsletters
===================== ==== =======

The **KWSApplicationProfile** object has a set of custom fields, specific for each app:

============ ======= =======
Field        Type    Meaning
============ ======= =======
username     String  Username
avatarId     Integer Avatar ID (if exists)
customField1 Integer Custom integer data field 1
customField2 Integer Custom integer data field 2
customField3 Integer Custom integer data field 3
customField4 Integer Custom integer data field 4
customField5 Integer Custom integer data field 5
============ ======= =======

.. note::

	Please note that depending on the available permissions you have (detailed in the **KWSPermissions** object) you may or may not
	see the various pieces of information associated with a user.

.. note::

  Also note that a parent may withdraw permission to access a user's details at any time. Your app should handle this scenario gracefully as well.
