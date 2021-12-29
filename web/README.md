# Gallery Web

## Creating a new web release on GH-Page

(Note: if you have a custom domain, first copy the `CNAME` file into web folder)
Publish the web release (using the
[peanut package](https://pub.dev/packages/peanut)):
   * `flutter pub global activate peanut`
   * `flutter pub global run peanut:peanut`
   * `git push origin gh-pages:gh-pages`