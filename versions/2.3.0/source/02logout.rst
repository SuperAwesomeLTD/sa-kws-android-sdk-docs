Logout a user
=============

To logout a certain user, just call:

.. code-block:: java

  KWSChildren.sdk.logoutUser(MainActivity.this);

After a user is logged out you won't be able to perform any of the SDK actions, like obtaining details, checking score, etc.
