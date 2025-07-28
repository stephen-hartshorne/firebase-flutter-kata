import 'package:firebase_flutter_kata/shared/models/question.dart';
import 'package:firebase_flutter_kata/shared/models/section.dart';

// taken from https://www.cms.gov/priorities/innovation/files/worksheets/ahcm-screeningtool.pdf

final List<Section> cmsQuestionnaire = [
  Section(
    title: 'Living Situation',
    questions: [
      Question(
        questionText: 'What is your living situation today?',
        type: QuestionType.radio,
        options: [
          'I have a steady place to live',
          'I have a place to live today, but I am worried about losing it in the future',
          'I do not have a steady place to live (I am temporarily staying with others, in a hotel, in a shelter, living outside on the street, on a beach, in a car, abandoned building, bus or train station, or in a park',
        ],
      ),
      Question(
        questionText:
            'Think about the place you live. Do you have problems with any of the following? (CHOOSE ALL THAT APPLY)',
        type: QuestionType.checkbox,
        options: [
          'Pests such as bugs, ants, or mice',
          'Mold',
          'Lead paint or pipes',
          'Lack of heat',
          'Oven or stove not working',
          'Smoke detectors missing or not working',
          'Water leaks',
          'None of the above',
        ],
      ),
    ],
  ),

  Section(
    title: 'Food',
    descriptionText:
        'Some people have made the following statements about their food situation. Please answer whether the statements were OFTEN, SOMETIMES, or NEVER true for you and your household in the last 12 months.',
    questions: [
      Question(
        questionText:
            'Within the past 12 months, you worried that your food would run out before you got money to buy more?',
        type: QuestionType.radio,
        options: ['Often true', 'Sometimes true', 'Never true'],
      ),
      Question(
        questionText:
            'Within the past 12 months, the food you bought just didn\'t last and you didn\'t have money to get more.',
        type: QuestionType.radio,
        options: ['Often true', 'Sometimes true', 'Never true'],
      ),
    ],
  ),

  Section(
    title: 'Transportation',
    questions: [
      Question(
        questionText:
            'In the past 12 months, has lack of reliable transportation kept you from medical appointments, meetings, work or from getting things needed for daily living?',
        type: QuestionType.radio,
        options: ['Yes', 'No'],
      ),
    ],
  ),

  Section(
    title: 'Utilities',
    questions: [
      Question(
        questionText:
            'In the past 12 months has the electric, gas, oil, or water company threatened to shut off services in your home?',
        type: QuestionType.radio,
        options: ['Yes', 'No', 'Already shut off'],
      ),
    ],
  ),

  Section(
    title: 'Safety',
    descriptionText:
        'Because violence and abuse happens to a lot of people and affects their health we are asking the following questions.',
    questions: [
      Question(
        questionText:
            'How often does anyone, including family and friends, physically hurt you?',
        type: QuestionType.radio,
        options: [
          'Never',
          'Rarely ',
          'Sometimes',
          'Fairly often',
          'Frequently',
        ],
      ),

      Question(
        questionText:
            'How often does anyone, including family and friends, insult or talk down to you?',
        type: QuestionType.radio,
        options: [
          'Never',
          'Rarely ',
          'Sometimes',
          'Fairly often',
          'Frequently',
        ],
      ),

      Question(
        questionText:
            'How often does anyone, including family and friends, threaten you with harm?',
        type: QuestionType.radio,
        options: [
          'Never',
          'Rarely ',
          'Sometimes',
          'Fairly often',
          'Frequently',
        ],
      ),

      Question(
        questionText:
            'How often does anyone, including family and friends, scream or curse at you?',
        type: QuestionType.radio,
        options: [
          'Never',
          'Rarely ',
          'Sometimes',
          'Fairly often',
          'Frequently',
        ],
      ),
    ],
  ),

  Section(
    title: 'Financial Strain',
    questions: [
      Question(
        questionText:
            'How hard is it for you to pay for the very basics like food, housing, medical care, and heating? Would you say it is:',
        type: QuestionType.radio,
        options: ['Very hard', 'Somwhat hard', 'Not hard at all'],
      ),
    ],
  ),

  Section(
    title: 'Employment',
    questions: [
      Question(
        questionText: 'Do you want help finding or keeping work or a job?',
        type: QuestionType.radio,
        options: [
          'Yes, help finding work',
          'Yes, help keeping work',
          'I do not need or want help',
        ],
      ),
    ],
  ),

  Section(
    title: 'Family and Community Support',
    questions: [
      Question(
        questionText:
            'If for any reason you need help with day-to-day activities such as bathing, preparing meals, shopping, managing finances, etc., do you get the help you need?',
        type: QuestionType.radio,
        options: [
          'I don’t need any help',
          'I get all the help I need',
          'I could use a little more help',
          'I need a lot more help',
        ],
      ),
      Question(
        questionText:
            'How often do you feel lonely or isolated from those around you?',
        type: QuestionType.radio,
        options: ['Never', 'Rarely', 'Sometimes', 'Often', 'Always'],
      ),
    ],
  ),

  Section(
    title: 'Education',
    questions: [
      Question(
        questionText: 'Do you speak a language other than English at home?',
        type: QuestionType.radio,
        options: ['Yes', 'No'],
      ),
      Question(
        questionText:
            'Do you want help with school or training? For example, starting or completing job training or getting a high school diploma, GED or equivalent.',
        type: QuestionType.radio,
        options: ['Yes', 'No'],
      ),
    ],
  ),

  Section(
    title: 'Physical Activity',
    questions: [
      Question(
        questionText:
            'In the last 30 days, other than the activities you did for work, on average, how many days per week did you engage in moderate exercise (like walking fast, running, jogging, dancing, swimming, biking, or other similar activities)?',
        type: QuestionType.radio,
        options: ['0', '1', '2', '3', '4', '5', '6', '7'],
      ),
      Question(
        questionText:
            'On average, how many minutes did you usually spend exercising at this level on one of those days?',
        type: QuestionType.radio,
        options: [
          '0',
          '10',
          '20',
          '30',
          '40',
          '50',
          '60',
          '90',
          '120',
          '150 or greater',
        ],
      ),
    ],
  ),

  Section(
    title: 'Substance Use',
    descriptionText:
        'The next questions relate to your experience with alcohol, cigarettes, and other drugs. Some of the substances are prescribed by a doctor (like pain medications), but only count those if you have taken them for reasons or in doses other than prescribed. One question is about illicit or illegal drug use, but we only ask in order to identify community services that may be available to help you. 1',
    questions: [
      Question(
        questionText:
            'How many times in the past 12 months have you had 5 or more drinks in a day (males) or 4 or more drinks in a day (females)? One drink is 12 ounces of beer, 5 ounces of wine, or 1.5 ounces of 80-proof spirits.',
        type: QuestionType.radio,
        options: [
          'Never',
          'Once or Twice',
          'Monthly',
          'Weekly',
          'Daily or Almost Daily',
        ],
      ),
      Question(
        questionText:
            'How many times in the past 12 months have you used tobacco products (like cigarettes, cigars, snuff, chew, electronic cigarettes)?',
        type: QuestionType.radio,
        options: [
          'Never',
          'Once or Twice',
          'Monthly',
          'Weekly',
          'Daily or Almost Daily',
        ],
      ),

      Question(
        questionText:
            'How many times in the past year have you used prescription drugs for non-medical reasons?',
        type: QuestionType.radio,
        options: [
          'Never',
          'Once or Twice',
          'Monthly',
          'Weekly',
          'Daily or Almost Daily',
        ],
      ),

      Question(
        questionText:
            'How many times in the past year have you used illegal drugs?',
        type: QuestionType.radio,
        options: [
          'Never',
          'Once or Twice',
          'Monthly',
          'Weekly',
          'Daily or Almost Daily',
        ],
      ),
    ],
  ),

  Section(
    title: 'Mental Health',
    descriptionText:
        'Over the past 2 weeks, how often have you been bothered by any of the following problems?',
    questions: [
      Question(
        questionText: 'Little interest or pleasure in doing things?',
        type: QuestionType.radio,
        options: [
          'Not at all',
          'Several days',
          'More than half the days',
          'Nearly every day',
        ],
      ),
      Question(
        questionText: 'Feeling down, depressed, or hopeless?',
        type: QuestionType.radio,
        options: [
          'Not at all',
          'Several days',
          'More than half the days',
          'Nearly every day',
        ],
      ),
    ],
  ),

  Section(
    title: 'Mental Health (Cont.)',
    questions: [
      Question(
        questionText:
            'Stress means a situation in which a person feels tense, restless, nervous, or anxious, or is unable to sleep at night because his or her mind is troubled all the time. Do you feel this kind of stress these days?',
        type: QuestionType.radio,
        options: [
          'Not at all',
          'A little bit',
          'Somewhat',
          'Quite a bit',
          'Very much',
        ],
      ),
    ],
  ),

  Section(
    title: 'Disabilities',
    questions: [
      Question(
        questionText:
            'Because of a physical, mental, or emotional condition, do you have serious difficulty concentrating, remembering, or making decisions?20 (5 years old or older)',
        type: QuestionType.radio,
        options: ['Yes', 'No'],
      ),
      Question(
        questionText:
            'Because of a physical, mental, or emotional condition, do you have difficulty doing errands alone such as visiting a doctor\'s office or shopping? (15 years old or older)',
        type: QuestionType.radio,
        options: ['Yes', 'No'],
      ),
    ],
  ),
];
