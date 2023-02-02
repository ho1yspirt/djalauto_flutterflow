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
      'ky': '',
      'ru': 'Войдите в свою учетную запись',
    },
    'wbpwdl5d': {
      'en': 'Log into your school account by phone verification',
      'ky': '',
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
      'ky': '',
      'ru': 'Отправить код',
    },
    '8r4544x5': {
      'en': 'Continue as Guest',
      'ky': '',
      'ru': 'Продолжить как гость',
    },
    '39gjiqja': {
      'en': 'Home',
      'ky': '',
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
      'ky': '',
      'ru': 'Подтвердите свой код',
    },
    '8bhl4np4': {
      'en': 'This code helps keep your account safe and secure.',
      'ky': '',
      'ru': 'Этот код помогает сохранить вашу учетную запись в безопасности.',
    },
    'le3xxirb': {
      'en': 'Confirm & Continue',
      'ky': '',
      'ru': 'Подтвердить и продолжить',
    },
    '1jamw8w0': {
      'en': 'Home',
      'ky': '',
      'ru': 'Дом',
    },
  },
  // schedule_screen
  {
    'si02gcny': {
      'en': 'Schedule',
      'ky': '',
      'ru': 'Расписание',
    },
    '9fbn1ae3': {
      'en': 'Add lesson',
      'ky': '',
      'ru': 'Записаться',
    },
    'nby1ehs7': {
      'en': 'Schedule',
      'ky': '',
      'ru': 'Расписание',
    },
  },
  // papers_screen
  {
    'jq724syr': {
      'en': 'Papers',
      'ky': '',
      'ru': 'Билеты',
    },
    'o015yp1e': {
      'en': 'Pass the exam',
      'ky': '',
      'ru': 'Сдать экзамен',
    },
    'u9xvb75t': {
      'en': 'Choose exam paper',
      'ky': '',
      'ru': 'Выбрать билет',
    },
    'laktg27m': {
      'en': 'Category ABM',
      'ky': '',
      'ru': 'Категория ABM',
    },
    'qjpkil86': {
      'en': 'Papers',
      'ky': '',
      'ru': 'Билеты',
    },
  },
  // account_screen
  {
    'htg3eled': {
      'en': 'Account',
      'ky': '',
      'ru': 'Аккаунт',
    },
    '6290rj1d': {
      'en': 'English',
      'ky': '',
      'ru': 'Англ',
    },
    '3qgi2646': {
      'en': 'Kyrgyz',
      'ky': '',
      'ru': 'Кырг',
    },
    'uoy1oier': {
      'en': 'Russian',
      'ky': '',
      'ru': 'Рус',
    },
    'syxhxanr': {
      'en': 'Account',
      'ky': '',
      'ru': 'Аккаунт',
    },
  },
  // single_paper_screen
  {
    'iiw1f6ry': {
      'en': 'Back',
      'ky': '',
      'ru': 'Назад',
    },
    '84vipzch': {
      'en': 'Papers#',
      'ky': '',
      'ru': 'Билет#',
    },
    'qcs5az7c': {
      'en': 'Question #',
      'ky': '',
      'ru': 'Вопрос #',
    },
    'qeekqouk': {
      'en': 'Next Question',
      'ky': '',
      'ru': 'След вопрос',
    },
    'quqxja46': {
      'en': 'Home',
      'ky': '',
      'ru': 'Дом',
    },
  },
  // web_home_screen
  {
    'zsdp03nv': {
      'en': '+996 500 353 541',
      'ky': '',
      'ru': '+996 500 353 541',
    },
    'hpqw8ed5': {
      'en': '+996 557 353 541',
      'ky': '',
      'ru': '+996 557 353 541',
    },
    'j2rlf1p3': {
      'en': 'Mn-St 9:00 am - 8:00 pm',
      'ky': '',
      'ru': 'Пн-Сб 9:00 - 20:00',
    },
    '62ze0wkc': {
      'en': 'Login',
      'ky': '',
      'ru': 'Аккаунт',
    },
    's41blwlp': {
      'en': 'Exam Papers',
      'ky': '',
      'ru': 'Билеты',
    },
    '9ecdlvu2': {
      'en': 'Pass the exam',
      'ky': '',
      'ru': 'Сдать экзамен',
    },
    'ofud6sv2': {
      'en': 'Pass the exam',
      'ky': '',
      'ru': 'Сдать экзамен',
    },
    '1eijth44': {
      'en': 'Auto school Djal Auto',
      'ky': '',
      'ru': 'Автошкола Джал Авто',
    },
    'hna0q270': {
      'en': 'The driving school trains drivers in category B',
      'ky': '',
      'ru': 'Автошкола проводит подготовку водителей по категории B',
    },
    '8zj07jc8': {
      'en': 'Call',
      'ky': '',
      'ru': 'Позвонить',
    },
    'jg87nku0': {
      'en': 'Auto school Djal Auto',
      'ky': '',
      'ru': 'Автошкола Джал Авто',
    },
    'ku0m22yc': {
      'en': 'Sign up for a driving practice by logging into your account',
      'ky': '',
      'ru': 'Войдите в свой аккаунт чтобы запсаться на практический урок',
    },
    'l9jdfzac': {
      'en': 'Login',
      'ky': '',
      'ru': 'Аккаунт',
    },
    '77mk0w4u': {
      'en': 'Auto school  Djal Auto',
      'ky': '',
      'ru': 'Автошкола Джал Авто',
    },
    '9gv02uj6': {
      'en':
          'In-depth knowledge and training of future drivers for safe driving',
      'ky': '',
      'ru': 'Глубокие знания и обучение будущих водителей безопасному вождению',
    },
    '4kzithgv': {
      'en':
          'Djal Auto Driving School - has teachers with higher education in the field of organization and road safety; These are driving instructors with many years of experience who continue to improve their professional skills in special courses.',
      'ky': '',
      'ru':
          'Школа Джал Авто - это преподаватели с высшим образованием в области организации и безопасности дорожного движения; это автоинструкторы с многолетним опытом, которые продолжают совершенствовать профессиональные навыки на специальных курсах.',
    },
    'll8svxp1': {
      'en': 'Equipped classrooms',
      'ky': '',
      'ru': 'Оборудованные классы',
    },
    'njsgpc79': {
      'en':
          'The classrooms are equipped with teaching aids, computer and video equipment.',
      'ky': '',
      'ru':
          'Учебные классы оборудованы учебными пособиями, компьютерной и видеотехникой.',
    },
    '1fn8zdma': {
      'en': 'State standard',
      'ky': '',
      'ru': 'Государственный стандарт',
    },
    'whmq8nhg': {
      'en':
          'The classrooms are equipped with teaching aids, computer and video equipment.',
      'ky': '',
      'ru':
          'Обучение проходит по государственному стандарту  Кыргызской Республики.',
    },
    '5ceypaex': {
      'en': 'Own auto fleet',
      'ky': '',
      'ru': 'Свой автопарк',
    },
    '6vimdjsl': {
      'en': 'Practical driving lessons in cars from the school\'s fleet.',
      'ky': '',
      'ru':
          'Практические занятие вождения проводиться на машинах их автопарка школы.',
    },
    'zeb22bbx': {
      'en': 'Education',
      'ky': '',
      'ru': 'Обучение',
    },
    'tribeop5': {
      'en': 'B',
      'ky': '',
      'ru': 'Б',
    },
    'un989qi6': {
      'en': 'Information about education:',
      'ky': '',
      'ru': 'Информация об обучении:',
    },
    'g0bnv290': {
      'en': '8000 soms',
      'ky': '',
      'ru': '8000 сом',
    },
    '5mxybp6f': {
      'en':
          '- From 17 years old\n- Training period - 10 weeks\n- Lesson (manual) 300 soms\n- Lesson (auto) 350 soms',
      'ky': '',
      'ru':
          '- Обучение с 17 лет\n- Срок обучения - 10 недель\n- Занятие (механика) 300 сом\n- Занятие (автомат) 350 сом',
    },
    'cj6uopum': {
      'en': 'Our Teachers',
      'ky': '',
      'ru': 'Наши преподаватели',
    },
    'kszjzapb': {
      'en': 'Auto fleet',
      'ky': '',
      'ru': 'Автопарк',
    },
    'ncf4ys6n': {
      'en': 'Installment education',
      'ky': '',
      'ru': 'Обучение с возможностью рассрочки',
    },
    'pkfqp0x0': {
      'en':
          'Training guarantee. \nFull accompaniment \nuntil  you get your \ndriver\'s license',
      'ky': '',
      'ru':
          'Гарантия на обучения. \nПолное сопровождение до \nтех пор, пока вы не получите \nводительское удостоверение',
    },
    'zqcyfdhq': {
      'en':
          'We will teach you to feel\n confident behind the wheel. \nTeach you how to drive with \nconfidence',
      'ky': '',
      'ru':
          'Научим вас уверенно чувствовать \nсебя за рулем. Научим вас \nуверенно чувствовать себя за \nрулем',
    },
    'nxfby8mv': {
      'en': 'Call and sign up',
      'ky': '',
      'ru': 'Позвонить и записаться',
    },
    'eay3fysw': {
      'en':
          'Call, discuss all the conditions \nand ask questions about training',
      'ky': '',
      'ru':
          'Позвоните, обговорите все условия\nи задайте вопросы насчет обучения',
    },
    't3ql6xcm': {
      'en': '+996 500 353 541',
      'ky': '',
      'ru': '+996 500 353 541',
    },
    'ip0vwqzd': {
      'en': '+996 557 353 541',
      'ky': '',
      'ru': '+996 557 353 541',
    },
    'ljh11oa5': {
      'en': 'Call',
      'ky': '',
      'ru': 'Позвонить',
    },
    'i2xuwfgr': {
      'en': 'License',
      'ky': '',
      'ru': 'Лицензия',
    },
    'cpmpqutq': {
      'en': 'Contact Information',
      'ky': '',
      'ru': 'Контактная информация',
    },
    'd49osh45': {
      'en': 'Bishkek, Nizhny Jal\nIsy Akhunbaeva 200',
      'ky': '',
      'ru': 'Бишкек, Нижний Джал \nИса Ахунбаева 200',
    },
    'jki6line': {
      'en': '+996 500 353 541',
      'ky': '',
      'ru': '+996 500 353 541',
    },
    'uiooxgrg': {
      'en': '+996 557 353 541',
      'ky': '',
      'ru': '+996 557 353 541',
    },
    'xd93z1rf': {
      'en': 'About us',
      'ky': '',
      'ru': 'О нас',
    },
    'k43ap3uw': {
      'en': 'Exam papers',
      'ky': '',
      'ru': 'Билеты',
    },
    '31bn5z84': {
      'en': 'Exam',
      'ky': '',
      'ru': 'Экзамен',
    },
    'qvjgkqf3': {
      'en': 'Schedule',
      'ky': '',
      'ru': 'Расписание',
    },
    'bmlqnbnh': {
      'en': 'Contact us in a convenient way for you',
      'ky': '',
      'ru': 'Свяжитесь с нами удобным вам способом',
    },
    'kbh3etjq': {
      'en': 'Call',
      'ky': '',
      'ru': 'Позвонить',
    },
    'itkdwbfg': {
      'en': 'Whatsapp',
      'ky': '',
      'ru': 'Whatsapp',
    },
    'ttezl4no': {
      'en': 'Instagram',
      'ky': '',
      'ru': 'Instagram',
    },
    'acmi0xya': {
      'en': '© 2023 Джал Авто',
      'ky': '',
      'ru': '© 2023 Джал Авто',
    },
    'no5gy9yq': {
      'en': 'Home',
      'ky': '',
      'ru': 'Home',
    },
  },
  // exam_screen
  {
    'hyi2lp4c': {
      'en': 'Back',
      'ky': '',
      'ru': 'Назад',
    },
    '4xe4muno': {
      'en': 'Page Title',
      'ky': '',
      'ru': 'Page Title',
    },
    'vh7rkd0k': {
      'en': 'Home',
      'ky': '',
      'ru': 'Home',
    },
  },
  // add_lesson_screen
  {
    'gc9qebz8': {
      'en': 'Back',
      'ky': '',
      'ru': 'Назад',
    },
    '2pr969e4': {
      'en': 'Create',
      'ky': '',
      'ru': 'Записаться',
    },
    'l5gtkid1': {
      'en': 'Add lesson',
      'ky': '',
      'ru': 'Записаться',
    },
    'txyi7dnt': {
      'en': 'Select time',
      'ky': '',
      'ru': 'Выбрать время',
    },
    'eoz6m9pa': {
      'en': 'Description',
      'ky': '',
      'ru': 'Дополнительно',
    },
    'emrglunx': {
      'en': 'Additional information',
      'ky': '',
      'ru': 'При необходимости напишите доп. информацию',
    },
    'c2ln2407': {
      'en': 'Home',
      'ky': '',
      'ru': 'Home',
    },
  },
  // lesson_screen
  {
    'utqt68p1': {
      'en': 'Back',
      'ky': '',
      'ru': 'Назад',
    },
    '10c9uqqs': {
      'en': 'Home',
      'ky': '',
      'ru': '',
    },
  },
  // paperBottomSheet
  {
    'nywmk25e': {
      'en': 'Pick Random',
      'ky': '',
      'ru': 'Выбрать случайный',
    },
  },
  // questionWithoutImageCard
  {
    'dooi43o9': {
      'en': 'This question without an image',
      'ky': '',
      'ru': 'Этот вопрос без изображения',
    },
  },
  // redirectPage
  {
    '172b21uj': {
      'en': 'Have an Account?',
      'ky': '',
      'ru': 'Уже есть аккаунт?',
    },
    'nzhkn70s': {
      'en': 'Log into your school account by phone verification.',
      'ky': '',
      'ru': 'Войти в свой Аккаунт с помощью верификации номера.',
    },
    'vvlu3jzh': {
      'en': 'Login',
      'ky': '',
      'ru': 'Войти',
    },
  },
  // teacherCard
  {
    'xqchvvs8': {
      'en': 'Profession: ',
      'ky': '',
      'ru': 'Профессия: ',
    },
    'dewzcztt': {
      'en': 'Experience:',
      'ky': '',
      'ru': 'Стаж:',
    },
    'bjidwdl6': {
      'en': 'Age: ',
      'ky': '',
      'ru': 'Возраст:',
    },
  },
  // webSideNavBar
  {
    '5empl6n0': {
      'en': 'Home page',
      'ky': '',
      'ru': 'Главная',
    },
    '3ms32jlv': {
      'en': 'Schedule',
      'ky': '',
      'ru': 'Расписание',
    },
    'dhoxwfwx': {
      'en': 'Exam Papers',
      'ky': '',
      'ru': 'Билеты',
    },
    '745jo0lr': {
      'en': 'Exam',
      'ky': '',
      'ru': 'Экзамен',
    },
    'wesf3jii': {
      'en': 'Add lesson',
      'ky': '',
      'ru': 'Записаться',
    },
    'opusnjoz': {
      'en': 'Account',
      'ky': '',
      'ru': 'Аккаунт',
    },
    'zjiiqp1c': {
      'en': 'Exit',
      'ky': '',
      'ru': 'Выйти',
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
