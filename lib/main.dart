import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

void main() {
  // 앱 실행 시 초기화 작업 수행
  WidgetsFlutterBinding.ensureInitialized();
  // 전체 화면으로 설정
  Flame.device.fullScreen();
  // 가로 방향으로 설정
  Flame.device.setLandscape();
  // 게임 위젯 실행
  runApp(GameWidget(game: BobooGame()));
}

class BobooGame extends FlameGame {
  // Boboo와 kitchen이라는 SpriteComponent를 정의
  SpriteComponent boboo = SpriteComponent();
  SpriteComponent kitchen = SpriteComponent();

  @override
  Future<void> onLoad() async {
    // kitchen 컴포넌트를 추가
    add(
      kitchen
        ..sprite = await loadSprite('world/kitchen.png')  // 이미지 로딩
        ..size = size,  // 전체 화면 크기로 설정
    );
    // boboo 컴포넌트를 추가
    add(
      boboo
        ..sprite = await loadSprite('actors/boboo_solo.png')  // 이미지 로딩
        ..size = Vector2.all(138)  // 크기 설정
        ..position = Vector2(0, 200)..anchor = Anchor.center,  // 초기 위치 설정
    );

    return super.onLoad();
  }

  @override
  void update(double dt) {
    // boboo가 화면을 벗어나지 않도록 x좌표를 이동
    if(boboo.x < size.x) {
      boboo.x += 60 * dt;
    }

    super.update(dt);
  }
}
