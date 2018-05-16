Request permissions
===================

If for any reason your app needs access to specific user information, like first name, last name, email address or physical address you'll first have
to ask permission for it. Kids Web Services will handle sending an explanatory email to the user's parent. From then on the parent will be able to
access the Parent Portal to manage these permissions.

Thus, to request permission for the user you're authenticated as you'll need to call:

.. code-block:: java

  // create an array of permissions
  KWSPermissionType[] permissions = new KWSPermissionType [] {
    KWSPermissionType.accessEmail,
    KWSPermissionType.accessFirstName
  };

  // request permission
  KWS.sdk.requestPermission (MainActivity, permissions, new KWSRequestPermissionInterface() {
    @Override
    public void requested (boolean success, boolean requested) {
      // handle request
    }
  });

The callback will pass the following values on completion:

========= ==== ======
Value     Type Meaning
========= ==== ======
success   Bool wether the network operation succeeded
requested Bool wether the permission could be requested
========= ==== ======

And the available permissions are:

+-------------------+
| **Permission**    |
+-------------------+
| accessEmail       |
+-------------------+
| accessAddress     |
+-------------------+
| accessFirstName   |
+-------------------+
| accessLastName    |
+-------------------+
| accessPhoneNumber |
+-------------------+
| sendNewsletter    |
+-------------------+

.. note::

  Normally just by requesting a permission you won't automatically get access to request or modify the associated bit of information. You'll have to await the parent's decision. You can always check the status in the **KWSUser** object's **KWSPermission** member.

.. note::

  If the callback **requested** parameter is **false** then it means the user doesn't yet have an associated parent email. This is common for new users. Check out the next section to find out how to request and submit the parent email.
