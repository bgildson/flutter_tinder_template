import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tinder_template/entities/entities.dart';
import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/selectors/selectors.dart';
import 'package:flutter_tinder_template/presentation/search_actions.dart';
import 'package:flutter_tinder_template/containers/swipe_strangers.dart';
import 'package:flutter_tinder_template/presentation/image_radar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageRadarSize = MediaQuery.of(context).size.width / 4;
    return new StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return new Column(
          children: <Widget>[
            new Expanded(
              child: vm.hasStrangers
                ? new Padding(
                    padding: new EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                    child: new SwipeStrangers()
                  )
                : new ImageRadar(
                    diameter: imageRadarSize,
                    image: vm.userFirstImageUrl == ''
                      ? new AssetImage('images/empty.jpg')
                      : new NetworkImage(vm.userFirstImageUrl)
                  )
            ),
            new SearchActions(
              onBackPressed: vm.onBackPressed,
              onNopePressed: vm.onNopePressed,
              onSuperLikePressed: vm.onSuperLikePressed,
              onLikePressed: vm.onLikePressed,
              onBoostPressed: vm.onBoostPressed,
            )
          ],
        );
      }
    );
  }
}

class ViewModel {
  ViewModel({
    this.userFirstImageUrl,
    this.hasStrangers,
    this.onBackPressed,
    this.onNopePressed,
    this.onSuperLikePressed,
    this.onLikePressed,
    this.onBoostPressed,
  });

  static ViewModel fromStore(Store<AppState> store) {
    return new ViewModel(
      userFirstImageUrl: userFirstImageUrlSelector(store),
      hasStrangers: hasStrangersSelector(store),
      onBackPressed: () => print('back'),
      onNopePressed: () => print('nope'),
      onSuperLikePressed: () => print('super like'),
      onLikePressed: () => print('like'),
      onBoostPressed: () => print('boost'),
    );
  }

  final String userFirstImageUrl;
  final bool hasStrangers;
  final VoidCallback onBackPressed;
  final VoidCallback onNopePressed;
  final VoidCallback onSuperLikePressed;
  final VoidCallback onLikePressed;
  final VoidCallback onBoostPressed;
}
