Invite friends
==============

You can invite other users on behalf of the user you're authenticated as by calling:

.. code-block:: java

  KWS.sdk.inviteUser (MainActivity, "friend@test.com", new KWSInviteUserInterface() {
    @Override
    public void invited (boolean success) {
      // handle success
    }
  });

The callback will pass the following value on completion:

======= ==== ======
Value   Type Meaning
======= ==== ======
invited Bool If true, user will receive an email inviting him to your app on behalf of KWS.
======= ==== ======
