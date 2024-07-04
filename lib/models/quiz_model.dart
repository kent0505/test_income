class QuizModel {
  final String question;
  final String image;
  final List<AnswerModel> answers;
  QuizModel({
    required this.question,
    required this.image,
    required this.answers,
  });
}

class AnswerModel {
  final String answer;
  final bool correct;
  AnswerModel({
    required this.answer,
    required this.correct,
  });
}

List<QuizModel> bankQuizes = [
  getQuiz1(),
  getQuiz2(),
  getQuiz3(),
  getQuiz4(),
  getQuiz5(),
];

List<QuizModel> financeQuizes = [
  getQuiz6(),
  getQuiz7(),
  getQuiz8(),
  getQuiz9(),
  getQuiz10(),
];

List<QuizModel> cryptoQuizes = [
  getQuiz11(),
  getQuiz12(),
  getQuiz13(),
  getQuiz14(),
  getQuiz15(),
];

QuizModel getQuiz1() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Accept deposits and provide loans', correct: true),
    AnswerModel(answer: 'Run public transportation', correct: false),
    AnswerModel(
        answer: 'Set interest rates for the central bank', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'What do commercial banks do?',
    image:
        'https://cdn.corporatefinanceinstitute.com/assets/AdobeStock_1080430-1024x686.jpeg',
    answers: answers,
  );
}

QuizModel getQuiz2() {
  List<AnswerModel> answers = [
    AnswerModel(
        answer: 'Set interest rates and regulate money supply', correct: true),
    AnswerModel(answer: 'Provide loans to individuals', correct: false),
    AnswerModel(answer: ' Manage the stock market', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'How do central banks influence the economy?',
    image:
        'https://insigniam.com/wp-content/uploads/2023/05/Insigniam_Economy-scaled.jpg',
    answers: answers,
  );
}

QuizModel getQuiz3() {
  List<AnswerModel> answers = [
    AnswerModel(
        answer: 'Retail serves individuals; investment serves corporations',
        correct: true),
    AnswerModel(
        answer:
            'Retail is for high-net-worth individuals; investment for non-profits',
        correct: false),
    AnswerModel(
        answer: 'Retail manages government funds; investment sets tax policies',
        correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'Difference between retail and investment banking?',
    image:
        'https://media.licdn.com/dms/image/D4D12AQFduBHH5Ti_Rw/article-cover_image-shrink_600_2000/0/1695070467834?e=2147483647&v=beta&t=TX6V5deVSguA5EM19N3k1iQykUHCMKpMJHpjO-HUiP0',
    answers: answers,
  );
}

QuizModel getQuiz4() {
  List<AnswerModel> answers = [
    AnswerModel(
        answer: 'Conduct credit assessments and require collateral',
        correct: true),
    AnswerModel(answer: 'Issue loans without assessments', correct: false),
    AnswerModel(answer: 'Lend based on social media profiles', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'How do banks manage lending risk?',
    image:
        'https://reciprocity.com/wp-content/uploads/2022/05/article_risk-management-software-banks_featured-img_730x270.jpg',
    answers: answers,
  );
}

QuizModel getQuiz5() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Increased convenience and competition', correct: true),
    AnswerModel(answer: 'No impact on traditional banking', correct: false),
    AnswerModel(answer: 'All traditional banks have shut down', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'Impact of fintech on traditional banking?',
    image:
        'https://i0.wp.com/franknez.com/wp-content/uploads/2023/08/FinTech.jpg?resize=676%2C405&ssl=1',
    answers: answers,
  );
}

QuizModel getQuiz6() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Short-term vs long-term', correct: true),
    AnswerModel(answer: 'Business vs individual', correct: false),
  ];

  answers.shuffle();
  answers.add(AnswerModel(answer: 'Same thing', correct: false));
  return QuizModel(
    question: 'Budget vs financial plan?',
    image:
        'https://dfpi.ca.gov/wp-content/uploads/sites/337/2024/01/coin-Piles.jpg',
    answers: answers,
  );
}

QuizModel getQuiz7() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Grows over time', correct: true),
    AnswerModel(answer: 'Decreases earnings', correct: false),
    AnswerModel(answer: 'Only short-term', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'Compound interest benefit?',
    image:
        'https://trustera.org.uk/wp-content/uploads/2023/12/Compound-Interest-Make-Your-Money-Work-for-You.jpg',
    answers: answers,
  );
}

QuizModel getQuiz8() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Assets, liabilities, net worth', correct: true),
    AnswerModel(answer: 'Income and expenses', correct: false),
    AnswerModel(answer: 'Savings and bills', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'Components of a personal financial statement?',
    image:
        'https://cloudinary.hbs.edu/hbsit/image/upload/s--sbHguciI--/f_auto,c_fill,h_375,w_750,/v20200101/32CD024732B5A4E25F0BD47CA4E468C3.jpg',
    answers: answers,
  );
}

QuizModel getQuiz9() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Reduces risk', correct: true),
    AnswerModel(answer: 'Invest in one stock', correct: false),
    AnswerModel(answer: 'Only high-risk assets', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'Diversification benefit?',
    image:
        'https://www6.royalbank.com/assets/di-secure/images/article/investing-academy/2021/what-is-diversification-928x529.jpg',
    answers: answers,
  );
}

QuizModel getQuiz10() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Convenience; Cons: High interest', correct: true),
    AnswerModel(answer: 'No repayment; Cons: Limited use', correct: false),
    AnswerModel(answer: 'Guaranteed returns; Cons: No limit', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'Credit card pros and cons?',
    image:
        'https://www.forbes.com/advisor/wp-content/uploads/2022/07/credit_cards.jpeg-1-1.jpg',
    answers: answers,
  );
}

QuizModel getQuiz11() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'A digital currency', correct: true),
    AnswerModel(answer: 'A physical coin', correct: false),
    AnswerModel(answer: 'A government bond', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'What is Bitcoin?',
    image:
        'https://forkast.news/wp-content/uploads/2023/10/Bitcoin-Silverbullet-4-1260x706.png',
    answers: answers,
  );
}

QuizModel getQuiz12() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'In digital wallets', correct: true),
    AnswerModel(answer: 'In bank accounts', correct: false),
    AnswerModel(answer: 'On physical drives', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'How are cryptocurrencies stored?',
    image:
        'https://www.yrcharisma.com/wp-content/uploads/2018/02/feat-image-1-1080x675.jpg',
    answers: answers,
  );
}

QuizModel getQuiz13() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'A decentralized ledger', correct: true),
    AnswerModel(answer: 'A type of malware', correct: false),
    AnswerModel(answer: 'A social media platform', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'What is blockchain?',
    image:
        'https://cdn.corporatefinanceinstitute.com/assets/AdobeStock_280230556-scaled.jpeg',
    answers: answers,
  );
}

QuizModel getQuiz14() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Through mining', correct: true),
    AnswerModel(answer: 'By printing', correct: false),
    AnswerModel(answer: 'By government issuance', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'How are new bitcoins created?',
    image:
        'https://images.squarespace-cdn.com/content/v1/593bf4fa46c3c411477261b8/1595353028770-V78UA8YGYT10JUK5VZXJ/How+Much+Was+Bitcoin+in+2009%3F.jpg',
    answers: answers,
  );
}

QuizModel getQuiz15() {
  List<AnswerModel> answers = [
    AnswerModel(answer: 'Smart contracts', correct: true),
    AnswerModel(answer: 'Printing money', correct: false),
    AnswerModel(answer: 'Sending emails', correct: false),
  ];
  answers.shuffle();
  return QuizModel(
    question: 'What is Ethereum used for?',
    image:
        'https://i-invdn-com.investing.com/news/Ethereum_800x533_L_1556445201.jpg',
    answers: answers,
  );
}
