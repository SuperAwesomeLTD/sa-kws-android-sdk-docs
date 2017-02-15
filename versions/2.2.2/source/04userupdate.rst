Update a user
=============

You can update information for the user you're authenticated as by calling:

.. code-block:: java

  // get an existing user instance
  KWSUser updatedUser = existingUser;

  // update a field
  updatedUser.lastName = "Name";

  // call the following method to update a users' details
  KWS.sdk.updateUser (MainActivity.this, new KWSUpdateUserInterface(){
    @Overwrite
    void updated (boolean updated) {
      // handle update
    }
  });

The callback will pass the following value on completion:

======= ==== ======
Value   Type Meaning
======= ==== ======
updated Bool wether the user could be updated
======= ==== ======

.. note::

	Please note that if you're trying to update a piece of information you haven't been granted permission for
	the whole update operation will fail.
