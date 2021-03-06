library rating;

import 'package:angular/angular.dart';

/* Use the @NgComponent annotation to indicate that this class is an
 * Angular component.
 *
 * The selector field defines the CSS selector that will trigger the
 * component. Typically, the CSS selector is an element name.
 *
 * The templateUrl field tells the component which HTML template to use
 * for its view.
 *
 * The cssUrl field tells the component which CSS file to use.
 *
 * The publishAs field specifies that the component instance should be
 * assigned to the current scope under the name specified.
 *
 * The class field and setter annotated with @NgTwoWay and @NgAttr,
 * respectively, identify the attributes that can be set on
 * the component. Users of this component will specify these attributes
 * in the HTML tag that is used to create the component. For example:
 *
 * <rating max-rating="5" rating="mycontrol.rating">
 *
 * The component's public fields are available for data binding from the
 * component's view. Similarly, the component's public methods can be
 * invoked from the component's view.
 */
@NgComponent(
    selector: 'rating',
    templateUrl: 'packages/angular_dart_demo/rating/rating_component.html',
    cssUrl: 'packages/angular_dart_demo/rating/rating_component.css',
    publishAs: 'cmp'
)
class RatingComponent {
  static const String _starOnChar = "\u2605";
  static const String _starOffChar = "\u2606";
  static const String _starOnClass = "star-on";
  static const String _starOffClass = "star-off";

  static final int DEFAULT_MAX = 5;
  
  List<int> stars = [];

  @NgTwoWay('rating')
  int rating;

  @NgAttr('max-rating')
  set maxRating(String value) {
    var count = value == null ? DEFAULT_MAX : 
        int.parse(value, onError: (_) => DEFAULT_MAX);
    stars = new List.generate(count, (i) => i+1);
  }

  String starClass(int star) {
    return star > rating ? _starOffClass : _starOnClass;
  }

  String starChar(int star) {
    return star > rating ? _starOffChar : _starOnChar;
  }

  void handleClick(int star) {
    rating = (star == 1 && rating == 1) ? 0 : star;
  }
}
