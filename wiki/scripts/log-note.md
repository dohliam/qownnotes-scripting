# log-note

Creates a a regular (daily or monthly) log or journal note

## Description

This script creates a menu item and a button to create or jump to a regular (daily or monthly) log or journal note.

It is a somewhat more versatile version of the [[daily-note]] script. After testing `daily-note` for some time, it became clear that creating a new note every day did not scale well. Too many notes were created making it difficult to find things, or else notes ended up bunched up together to keep related notes together.

A monthly note has so far proven to be an ideal duration. Rather than create a new "monthly-note" script, this script can handle monthly or daily frequencies. If there is a use case for it, adding "yearly" or even "hourly" note frequencies as options to the script might also be feasible.

## To do list

One useful application of this script is for keeping track of simple to do lists without relying on the built-in to do list functionality of QOwnNotes or linking with an external provider.

Each time you click on the button / menu item for this script, it will take you to either the existing note for the time period you have selected or a new note if none exists already.

Once you have jumped to the note, you can manage to do items using the checkbox syntax supported by QOwnNotes.

If you have a lot of tasks to keep track of every day, the daily frequency might be a good idea. Otherwise, monthly might work better.

When a new month (or day) arrives, you can start from a fresh slate, keeping your to do list clean and manageable while also preserving old tasks in a neat date-organized archive for easy reference.

## Journal

This script could also be used to help keep a regular journal. For a daily journal, set the frequency to "daily". This will create a new journal note every day.

Much like the existing `journal-entry` script, you can choose the name of the subfolder you would like to use to hold your notes. You can also provide multiple default folders as a list in order to use different names for your journal folder in different note repositories. Just separate the folder names with a single comma, e.g.:

```
journal,Tagebuch,diary,tasks
```

The above would search for each of the listed folders in order and use the first one found as the default folder. So for example if you have one note repository with a folder named `journal` for work, and another personal repository with a folder called `Tagebuch` the script should automatically use the correct folder for each.

## Options

* Remove separators
* Show day in date (default: show year and month only)
* Template
* Date separator
* Headline prefix
