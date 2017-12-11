---
layout: documentation
title: Users and groups
id: users
permalink: /docs/users.html
---

When you use Horizon's [Authentication system][auth], user information is stored in a special Horizon [collection][coll], `users`. You can use the `users` collection the same way you use any other collection, or through a special shortcut accessor:

[auth]: $$ROOT$$/docs/auth.html
[coll]: $$ROOT$$/api/collection.html

```js
const horizon = Horizon();

// Access as a standard collection
const users = horizon('users');

// Access through the shortcut
const users = horizon.users;
```

When a new user is created, they're automatically assigned to two user groups, `default` and `authenticated`. User groups are used to assign permissions; for more information about the way the permission system works, read [Permissions and schema enforcement][perm]. The document created for each new user contains their unique ID and a list of groups they belong to:

[perm]: $$ROOT$$/docs/permissions.html

```json
{
    "id": "D6B8E9D0-CD96-4C01-BFD6-2AF43141F2A7",
    "groups": [ "default", "authenticated" ]
}
```

If you wanted to add data to this user record, you would `find` the record, make the change, and then `replace` it in the collection.

```js
horizon.users.find("D6B8E9D0-CD96-4C01-BFD6-2AF43141F2A7").fetch().subscribe(
    (user) => {
        // add a 'name' key
        user.data.name = "Bob";
        horizon.users.replace(user);
    }
);
```

To add a user to a group, or remove them from a group, modify the `groups` field.

```js
horizon.users.find("D6B8E9D0-CD96-4C01-BFD6-2AF43141F2A7").fetch().subscribe(
    (user) => {
        // add to the 'admin' group
        user.groups.push('admin');
        horizon.users.replace(user);
    }
);
```

**A Horizon application allows _no_ access to collections by default, even for authenticated users!** For more information, read the documentation on [permissions][perm].

## Accessing session data

You can check whether a user is currently authenticated using the [Horizon.hasAuthToken][ha] method, and access their information with [Horizon.currentUser][cu].

```js
if (Horizon.hasAuthToken()) {
    console.log(Horizon.currentUser());
} else {
    console.log("No user info available");
}
```

The `currentUser` is a user object as described in [Users and groups][users], or an empty object if the user is unauthenticated.

[ha]:    $$ROOT$$/api/horizon.html#hasauthtoken
[cu]:    $$ROOT$$/api/horizon.html#currentuser
[users]: $$ROOT$$/docs/users.html

## See also

* [Permissions and schema enforcement][perm]
* [Horizon authentication][auth]
