Associate a parent email
========================

You can associate a parent email for the user you're authenticated as by calling:

.. code-block:: java

  KWSChildren.sdk.updateParentEmail (MainActivity.this,
                                     "parent@test.com",
                                     new KWSChildrenUpdateParentEmailInterface ()
  {
    @Override
    public void didUpdateParentEmail (KWSChildrenUpdateParentEmailStatus status) {

      switch (type) {
        case Success:
          break;
        case Invalid:
          break;
        case NetworkError:
          break;
      }
    }
  });

The callback will pass the following value on completion:

====== ================================== ======
Value                                     Type Meaning
====== ================================== ======
status KWSChildrenUpdateParentEmailStatus End status of the operation
====== ================================== ======

The **status** parameter may have the following values:

============ ======
Value        Meaning
============ ======
Success      Submitted parent email successfully
Invalid      Not a valid email
NetworkError Other network error
============ ======

.. note::

  Once the parent email is successfully submitted you'll be able to request permissions.

There's also a quick hand version of this method that displays a standard system popup to enable the user to submit an email:

.. code-block:: java

  KWSChildren.sdk.updateParentEmailWithPopup (MainActivity, new KWSChildrenUpdateParentEmailInterface() {
    @Override
		  public void didUpdateParentEmail (KWSChildrenUpdateParentEmailStatus status) {
				// handle email submit
      }
  });
