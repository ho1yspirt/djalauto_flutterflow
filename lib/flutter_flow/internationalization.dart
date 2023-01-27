import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ru', 'ky'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ruText = '',
    String? kyText = '',
  }) =>
      [enText, ruText, kyText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login_screen
  {
    'piwd2zq7': {
      'en': 'Log In your Account',
      'ky': 'Каттоо эсебиңизге кириңиз',
      'ru': 'Войдите в свою учетную запись',
    },
    'wbpwdl5d': {
      'en': 'Log into your school account by phone verification',
      'ky': 'Телефондук текшерүү аркылуу мектеп эсебиңизге кириңиз',
      'ru': 'Войдите в свою школьную учетную запись, подтвердив телефон',
    },
    '5vo9yod9': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'lnajsh6v': {
      'en': '+996',
      'ky': '+996',
      'ru': '+996',
    },
    '9n399h1x': {
      'en': '+996',
      'ky': '+996',
      'ru': '+996',
    },
    'wuvhwo2i': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'wjb728eu': {
      'en': '000 000 000',
      'ky': '000 000 000',
      'ru': '000 000 000',
    },
    '7gsn9gty': {
      'en': 'Send Code',
      'ky': 'Кодду жөнөтүү',
      'ru': 'Отправить код',
    },
    '8r4544x5': {
      'en': 'Continue as Guest',
      'ky': 'Конок катары улантуу',
      'ru': 'Продолжить как гость',
    },
    '39gjiqja': {
      'en': 'Home',
      'ky': 'Үй',
      'ru': 'Дом',
    },
  },
  // sms_auth_screen
  {
    'n5ei50en': {
      'en': 'SMS Auth',
      'ky': 'SMS Auth',
      'ru': 'SMS-авторизация',
    },
    '7pqlgorn': {
      'en': 'Confirm your Code',
      'ky': 'Кодуңузду ырастаңыз',
      'ru': 'Подтвердите свой код',
    },
    '8bhl4np4': {
      'en': 'This code helps keep your account safe and secure.',
      'ky':
          'Бул код каттоо эсебиңизди коопсуз жана коопсуз сактоого жардам берет.',
      'ru': 'Этот код помогает сохранить вашу учетную запись в безопасности.',
    },
    'le3xxirb': {
      'en': 'Confirm & Continue',
      'ky': 'Ырастоо & Улантуу',
      'ru': 'Подтвердить и продолжить',
    },
    '1jamw8w0': {
      'en': 'Home',
      'ky': 'Үй',
      'ru': 'Дом',
    },
  },
  // schedule_screen
  {
    'si02gcny': {
      'en': 'Schedule',
      'ky': 'График',
      'ru': 'Расписание',
    },
    'nby1ehs7': {
      'en': 'Schedule',
      'ky': 'График',
      'ru': 'Расписание',
    },
  },
  // papers_screen
  {
    'jq724syr': {
      'en': 'Page Title',
      'ky': 'Барактын аталышы',
      'ru': 'Заголовок страницы',
    },
    'o015yp1e': {
      'en': 'Pass the exam',
      'ky': 'Экзаменден өт',
      'ru': 'Сдать экзамен',
    },
    'oc9mwrrp': {
      'en': 'Choose exam paper',
      'ky': 'Экзамен кагазын тандаңыз',
      'ru': 'Выбрать экзаменационную работу',
    },
    'ynmb8cg7': {
      'en': 'Category ABM',
      'ky': 'ABM категориясы',
      'ru': 'Категория ПРО',
    },
    'qjpkil86': {
      'en': 'Papers',
      'ky': 'Кагаздар',
      'ru': 'Документы',
    },
  },
  // account_screen
  {
    'htg3eled': {
      'en': 'Account',
      'ky': 'Каттоо эсеби',
      'ru': 'Счет',
    },
    'syxhxanr': {
      'en': 'Account',
      'ky': 'Каттоо эсеби',
      'ru': 'Счет',
    },
  },
  // single_paper_screen
  {
    'iiw1f6ry': {
      'en': 'Back',
      'ky': 'Артка',
      'ru': 'Назад',
    },
    '84vipzch': {
      'en': 'Papers#',
      'ky': 'Кагаздар#',
      'ru': 'Документы#',
    },
    'qcs5az7c': {
      'en': 'Question #',
      'ky': 'Суроо №',
      'ru': 'Вопрос #',
    },
    'qeekqouk': {
      'en': 'Next Question',
      'ky': 'Кийинки суроо',
      'ru': 'Следующий вопрос',
    },
    'quqxja46': {
      'en': 'Home',
      'ky': 'Үй',
      'ru': 'Дом',
    },
  },
  // web_home_screen
  {
    'zsdp03nv': {
      'en': '+996 500 353 541',
      'ky': '',
      'ru': '',
    },
    'hpqw8ed5': {
      'en': '+996 557 353 541',
      'ky': '',
      'ru': '',
    },
    'j2rlf1p3': {
      'en': 'Mn-St 9:00 am - 8:00 pm',
      'ky': '',
      'ru': '',
    },
    '62ze0wkc': {
      'en': 'Login',
      'ky': '',
      'ru': '',
    },
    's41blwlp': {
      'en': 'Exam Papers',
      'ky': '',
      'ru': '',
    },
    '9ecdlvu2': {
      'en': 'Pass the exam',
      'ky': '',
      'ru': '',
    },
    'ofud6sv2': {
      'en': 'Pass the exam',
      'ky': '',
      'ru': '',
    },
    '1eijth44': {
      'en': 'Auto school Djal Auto',
      'ky': '',
      'ru': '',
    },
    'hna0q270': {
      'en': 'The driving school trains drivers in category B',
      'ky': '',
      'ru': '',
    },
    '8zj07jc8': {
      'en': 'Call',
      'ky': '',
      'ru': '',
    },
    'jg87nku0': {
      'en': 'Auto school Djal Auto',
      'ky': '',
      'ru': '',
    },
    'ku0m22yc': {
      'en': 'Sign up for a driving practice by logging into your account',
      'ky': '',
      'ru': '',
    },
    'l9jdfzac': {
      'en': 'Login',
      'ky': '',
      'ru': '',
    },
    '77mk0w4u': {
      'en': 'Auto school  Djal Auto',
      'ky': '',
      'ru': '',
    },
    '9gv02uj6': {
      'en':
          'In-depth knowledge and training of future drivers for safe driving',
      'ky': '',
      'ru': '',
    },
    '4kzithgv': {
      'en':
          'Djal Auto Driving School - has teachers with higher education in the field of organization and road safety; These are driving instructors with many years of experience who continue to improve their professional skills in special courses.',
      'ky': '',
      'ru': '',
    },
    'll8svxp1': {
      'en': 'Equipped classrooms',
      'ky': '',
      'ru': '',
    },
    'njsgpc79': {
      'en':
          'The classrooms are equipped with teaching aids, computer and video equipment.',
      'ky': '',
      'ru': '',
    },
    '1fn8zdma': {
      'en': 'State standard',
      'ky': '',
      'ru': '',
    },
    'whmq8nhg': {
      'en':
          'The classrooms are equipped with teaching aids, computer and video equipment.',
      'ky': '',
      'ru': '',
    },
    '5ceypaex': {
      'en': 'Own auto fleet',
      'ky': '',
      'ru': '',
    },
    '6vimdjsl': {
      'en': 'Practical driving lessons in cars from the school\'s fleet.',
      'ky': '',
      'ru': '',
    },
    'zeb22bbx': {
      'en': 'Education',
      'ky': '',
      'ru': '',
    },
    'tribeop5': {
      'en': 'B',
      'ky': '',
      'ru': '',
    },
    'un989qi6': {
      'en': 'Information about education:',
      'ky': '',
      'ru': '',
    },
    'g0bnv290': {
      'en': '8000 soms',
      'ky': '',
      'ru': '',
    },
    '5mxybp6f': {
      'en':
          '- From 17 years old\n- Training period - 10 weeks\n- Lesson (manual) 300 soms\n- Lesson (auto) 350 soms',
      'ky': '',
      'ru': '',
    },
    'cj6uopum': {
      'en': 'Our Teachers',
      'ky': '',
      'ru': '',
    },
    'kszjzapb': {
      'en': 'Auto fleet',
      'ky': '',
      'ru': '',
    },
    'fayn6fk6': {
      'en': 'Installment education',
      'ky': '',
      'ru': '',
    },
    'duxuvykt': {
      'en':
          'Training guarantee. \nFull accompaniment \nuntil  you get your \ndriver\'s license',
      'ky': '',
      'ru': '',
    },
    'rlzjsfar': {
      'en':
          'We will teach you to feel\n confident behind the wheel. \nTeach you how to drive with \nconfidence',
      'ky': '',
      'ru': '',
    },
    '4khmy023': {
      'en': 'Call and sign up',
      'ky': '',
      'ru': '',
    },
    '42m1qrda': {
      'en':
          'Call, discuss all the conditions \nand ask questions about training',
      'ky': '',
      'ru': '',
    },
    '34xnutbs': {
      'en': '+996 500 353 541',
      'ky': '',
      'ru': '',
    },
    '7rteuw5o': {
      'en': '+996 557 353 541',
      'ky': '',
      'ru': '',
    },
    '875ahrgi': {
      'en': 'Call',
      'ky': '',
      'ru': '',
    },
    'i2xuwfgr': {
      'en': 'License',
      'ky': '',
      'ru': '',
    },
    'cpmpqutq': {
      'en': 'Contact Information',
      'ky': '',
      'ru': '',
    },
    'pbzebq5a': {
      'en': 'Bishkek, Nizhny Jal\\nIsy\nAkhunbaeva 200',
      'ky': '',
      'ru': '',
    },
    'w01jrcim': {
      'en': '+996 500 353 541',
      'ky': '',
      'ru': '',
    },
    'qv5gu0u8': {
      'en': '+996 557 353 541',
      'ky': '',
      'ru': '',
    },
    '1fma3ahg': {
      'en': 'Button',
      'ky': '',
      'ru': '',
    },
    'rzoq03ma': {
      'en': 'Button',
      'ky': '',
      'ru': '',
    },
    'ixc47h5t': {
      'en': 'Button',
      'ky': '',
      'ru': '',
    },
    '38sk2pwi': {
      'en': 'Hello World',
      'ky': '',
      'ru': '',
    },
    '2xum342j': {
      'en': 'Call',
      'ky': '',
      'ru': '',
    },
    've7s55cu': {
      'en': 'Whatsapp',
      'ky': '',
      'ru': '',
    },
    'n2oor4gm': {
      'en': 'Instagram',
      'ky': '',
      'ru': '',
    },
    'p0977xhx': {
      'en': '© 2023 Джал Авто',
      'ky': '',
      'ru': '',
    },
    'no5gy9yq': {
      'en': 'Home',
      'ky': '',
      'ru': '',
    },
  },
  // web_schedule_screen
  {
    'gjre5ym5': {
      'en': 'Home',
      'ky': '',
      'ru': '',
    },
  },
  // paperBottomSheet
  {
    'nywmk25e': {
      'en': 'Pick Random',
      'ky': 'Random тандоо',
      'ru': 'Выбрать случайным образом',
    },
  },
  // questionWithoutImageCard
  {
    'dooi43o9': {
      'en': 'This question without an image',
      'ky': 'Сүрөтсүз бул суроо',
      'ru': 'Этот вопрос без изображения',
    },
  },
  // redirectPage
  {
    '172b21uj': {
      'en': 'Have an Account?',
      'ky': 'Каттоо эсебиңиз барбы?',
      'ru': 'Иметь аккаунт?',
    },
    'nzhkn70s': {
      'en': 'Log into your school account by phone verification.',
      'ky': 'Телефондук текшерүү аркылуу мектеп эсебиңизге кириңиз.',
      'ru': 'Войдите в свою школьную учетную запись, подтвердив телефон.',
    },
    'vvlu3jzh': {
      'en': 'Login',
      'ky': 'Кирүү',
      'ru': 'Авторизоваться',
    },
  },
  // teacherCard
  {
    '0v5xuq7u': {
      'en': 'Profession: ',
      'ky': '',
      'ru': '',
    },
    '0ri0yqle': {
      'en': 'Experience:',
      'ky': '',
      'ru': '',
    },
    'cibkjyeu': {
      'en': 'Age: ',
      'ky': '',
      'ru': '',
    },
  },
  // Miscellaneous
  {
    'm6anx7cm': {
      'en': 'In order to use Schedule you need to provide calendar permission',
      'ky': 'Графикти колдонуу үчүн сиз календарга уруксат беришиңиз керек',
      'ru':
          'Чтобы использовать Расписание, вам необходимо предоставить разрешение календаря.',
    },
    'o4fc1n1e': {
      'en':
          'In order to use Schedule you need to provide notification permission',
      'ky': 'Графикти колдонуу үчүн эскертме уруксатын беришиңиз керек',
      'ru':
          'Чтобы использовать Расписание, вам необходимо предоставить разрешение на уведомление',
    },
    'u8djwmo0': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'ebkkqhyi': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'qnumqtjj': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'lorec3no': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'hbftkbic': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'rt7k7kow': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    '5x4gjvcy': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'fywgbyev': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'd2rjy1yw': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    '8en39anu': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    '0ry8ixbx': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'jqi0f3ez': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'ddjagt8j': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'uwwpbvbm': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'ex49yo4w': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    'unla9rib': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    '6v0939x6': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    '4kwkjp0d': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    '6wo5f96m': {
      'en': '',
      'ky': '',
      'ru': '',
    },
    '6ekyviue': {
      'en': '',
      'ky': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
