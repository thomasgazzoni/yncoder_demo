import 'package:yncoder_demo/model/blog_post.dart';

List<BlogPostModel> getBlogPosts() => [
      BlogPostModel(
          id: 75,
          title: 'ComeTree 联合举办社区活动',
          content: '基本信息\n地点: 云大科技创业园负一楼报告厅',
          authorName: 'ZhangRGK',
          authorUrl: 'https://avatars1.githubusercontent.com/u/4213847?v=4',
          category: Category.activities),
      BlogPostModel(
          id: 73,
          title: '2019年第一次社区活动',
          content: '时间: 2019年1月26日 下午 2:00\n地点: 云南大学科技创业园2楼',
          authorName: 'ZhangRGK',
          authorUrl: 'https://avatars1.githubusercontent.com/u/4213847?v=4',
          category: Category.activities),
      BlogPostModel.fromJson({
        'id': 70,
        'title': '云大 ComeTree & Yncoder 第二期分享会',
        'content': '时间：9月15号（星期六）下午2点<br>地点：云大科技创业园',
        'authorName': 'mytharcher',
        'authorUrl': 'https://avatars1.githubusercontent.com/u/525658?v=4',
        'category': 'activities',
      }),
      BlogPostModel(
          id: 65,
          title: '黑名单一PHP 面试冒用Laravel-china “leo”一朱国强',
          content:
              '此人冒用Laravel-china管理员“leo”，为了进一步验证，向他索要了 Github ID ，和 Laravel-china 管理员 leo 的 Github ID 一致',
          authorName: 'viest',
          authorUrl: 'https://avatars3.githubusercontent.com/u/14308107?v=4',
          category: Category.activities),
    ];
