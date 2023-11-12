**UPDATE WARNING**: This plugin uses composer, so on the next Kimai update it may break.
Therefor please check the installation by running the following command ```git status```. If the output is any different than 
```
Not currently on any branch.
nothing to commit, working tree clean
```
you have changes in at least one of the files in your installation.
This can result in error messages like this (file names can vary) when trying to update Kimai:
```
error: Your local changes to the following files would be overwritten by checkout:
symfony.lock
Please commit your changes or stash them before you switch branches.
```
or 
```
config/routes/annotations.yaml: needs merge
error: you need to resolve your current index first
```
This means, you have to revert the changes before the update can be executed. This can be done either with ```git stash``` (and running ```git stash apply``` after the update) or with the rather extreme option to run ```git reset --hard``` (attention: wipes all local changes). After reverting these changes you can continue as usual with the update of Kimai. Afterwards you just have to reinstall the plugin.

Please read **GIT docs** for more details on that, it is **NOT** related to Kimai.