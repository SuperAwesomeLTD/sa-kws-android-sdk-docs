Request permissions
===================

If for any reason your app needs access to specific user information, like first name, last name, email address or physical address you'll first have
to ask permission for it. Kids Web Services will handle sending an explanatory email to the user's parent. From then on the parent will be able to
access the Parent Portal to manage these permissions.

Thus, to request permission for the user you're authenticated as you'll need to call:

.. code-block:: java

  // create an array of permissions
  KWSChildrenPermissionType[] permissions = new KWSChildrenPermissionType [] {
    KWSChildrenPermissionType.AccessEmail,
    KWSChildrenPermissionType.AccessFirstName
  };

  // request permission
  KWSChildren.sdk.requestPermission (MainActivity.this,
                                     permissions,
                                     new KWSChildrenRequestPermissionInterface()
  {
    @Override
    public void didRequestPermission (KWSChildrenRequestPermissionStatus status) {

      switch (status) {
        case Success:
          break;
        case NoParentEmail:
          break;
        case NetworkError:
          break;
      }
    }
  });

The callback will pass the following values on completion:

====== ================================== ======
Value  Type                               Meaning
====== ================================== ======
status KWSChildrenRequestPermissionStatus End status of the operation
====== ================================== ======

The **status** parameter may have the following values:

============= ======
Value         Meaning
============= ======
Success       User asked for permission successfully
NoParentEmail User does not have an attached parent email
NetworkError  Other network error
============= ======

And the available permissions are:

+-------------------+
| **Permission**    |
+-------------------+
| AccessEmail       |
+-------------------+
| AccessAddress     |
+-------------------+
| AccessFirstName   |
+-------------------+
| AccessLastName    |
+-------------------+
| AccessPhoneNumber |
+-------------------+
| SendNewsletter    |
+-------------------+

.. note::

  Normally just by requesting a permission you won't automatically get access to request or modify the associated bit of information. You'll have to await the parent's decision. You can always check the status in the **KWSUser** object's **KWSPermission** member.

.. note::

  If the callback **requested** parameter is **false** then it means the user doesn't yet have an associated parent email. This is common for new users. Check out the next section to find out how to request and submit the parent email.
