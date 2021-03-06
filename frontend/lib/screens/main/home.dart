import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/router.dart';
import 'package:frontend/screens/main/search.dart';
import 'package:go_router/go_router.dart';

import '../../common/styles.dart';

class HomePage extends StatefulWidget {
  final void Function()? callback;
  const HomePage({Key? key, required this.callback}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(
            'assets/images/title.png',
            scale: 0.5,
            height: 60,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go(AppRouter.scan),
            icon: const Icon(Icons.qr_code_scanner_rounded),
          ),
          IconButton(
            onPressed: () async {
              await showSearch(context: context, delegate: search);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 236,
              child: Swiper(
                itemBuilder: (context, idx) => Image.asset(
                  'assets/images/banner/${idx + 1}.jpg',
                  fit: BoxFit.fill,
                ),
                indicatorLayout: PageIndicatorLayout.NONE,
                autoplay: true,
                itemCount: 5,
                pagination: const SwiperPagination(),
              ),
            ),
            SizedBox(
              height: 244,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: const [
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            name: '????????????',
                            imageIdx: 1,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            name: '????????????',
                            imageIdx: 2,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            name: '????????????',
                            imageIdx: 3,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            name: '????????????',
                            imageIdx: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: const [
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            name: '????????????',
                            imageIdx: 5,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            name: '????????????',
                            imageIdx: 6,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            name: '????????????',
                            imageIdx: 7,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            name: '????????????',
                            imageIdx: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('assets/images/ad.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 15,
                bottom: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      shape: BoxShape.rectangle,
                    ),
                    height: 28,
                    width: 7,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 11),
                    child: Text(
                      '????????????',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: AppFont.title,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: TextButton(
                      onPressed: widget.callback,
                      child: Center(
                        child: Row(
                          children: const [
                            Text(
                              '??????',
                              style: TextStyle(
                                color: AppColor.homeDetail,
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.homeDetail,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: 580,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  children: <TableRow>[
                    TableRow(
                      children: List<Widget>.generate(
                        exhibitionArr.length,
                        (idx) => TableCell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: GestureDetector(
                              onTap: () => context.push(
                                  '${AppRouter.detail}/?index=${idx + 1}'),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                child: Image.asset(
                                  'assets/images/slider/${idx + 1}.jpg',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableRow(
                      children: List<Widget>.generate(
                        exhibitionArr.length,
                        (idx) => TableCell(
                          child: GestureDetector(
                            onTap: () => context
                                .push('${AppRouter.detail}/?index=${idx + 1}'),
                            child: Container(
                              padding: const EdgeInsets.only(top: 10),
                              margin: const EdgeInsets.only(left: 12),
                              child: AutoSizeText(
                                exhibitionArr[idx],
                                // textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: AppFont.label,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('assets/images/ad2.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final int imageIdx;
  const CustomButton({Key? key, required this.name, required this.imageIdx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/button/$imageIdx.png',
            height: 85,
          ),
          Text(
            name,
            style: const TextStyle(
              fontFamily: AppFont.label,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

const exhibitionArr = <String>[
  '????????????????????????',
  '????????????--???????????????',
  '???????????????????????????',
  '???????????????????????????',
  '??????????????????',
];
