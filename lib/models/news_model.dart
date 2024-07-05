class NewsModel {
  final String title;
  final String subtitle;
  final String image;
  final String date;

  NewsModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.date,
  });
}

List<NewsModel> newsData = [
  NewsModel(
    title: 'Digital pound future clearer under a Labour government',
    subtitle:
        'The Labour party remains on course for victory in today\'s general election, with few expecting significant change that would impact banking and the financial sector more broadly if it were to come to power. But while details on various proposals were scant in the party\'s manifesto, including on a central bank digital currency',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/digital-pound-graphic/13202637-1-eng-GB/Digital-pound-graphic.jpg?source=specialist-tb-article&width=816',
    date: '1d ago',
  ),
  NewsModel(
    title:
        'Non-performing loans in emerging Europe rose in 2023 after a three-year decline',
    subtitle:
        'Non-performing loan volumes across CESEE rose on average by 0.9 per cent to €27.5bn between December 2022 and December 2023, with most countries maintaining a “steady NPL ratio”, with the exception of a few outliers. Non-performing loan volumes across CESEE rose on average by 0.9 per cent to €27.5bn between December 2022 and December 2023, with most countries maintaining a “steady NPL ratio”, with the exception of a few outliers.',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/databank-040724/13202641-1-eng-GB/Databank-040724.jpg?source=design-system&width=495',
    date: '23h ago',
  ),
  NewsModel(
    title:
        'Barclays sells €4.7bn German unit to Austria\'s Bawag; Russian central bank backs crypto to counter sanctions',
    subtitle:
        'Barclays has struck a deal to sell its German consumer banking business to Austrian bank Bawag for a “small premium over net assets”, it announced on Thursday. The sale is expected to release around €4bn of risk weighted assets, increasing Barclays\' common equity tier 1 ratio by around 10 basis points on completion. The sale comes as part of a strategic move to simplify Barclays\' operations and will allow Bawag to expand its loan book and customer base in the country. Barclays\' German banking business held €4.7bn in gross assets at the end of March, mainly in card and loan receivables, and employs around 700 staff. ',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/barclays-signage/13191293-1-eng-GB/Barclays-signage.jpg?source=specialist-tb-article&width=816',
    date: '22h ago',
  ),
  NewsModel(
    title:
        'EBA warns of €1.4tn EU bank commercial real estate exposure; Fitch: climate debt freezes won’t hit MDB ratings',
    subtitle:
        'Banks in Germany, France and other EU countries have lent over €1.4tn to the commercial real estate sector, creating potential vulnerabilities, the European Banking Authority has warned. In its latest , the EBA said total EU bank exposure to commercial real estate has increased by 40 per cent to €1.4tn over the past decade, with smaller banks holding exposures that are now multiple times their equity being particularly at risk.',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/venice-real-estate/13202515-1-eng-GB/Venice-real-estate.jpg?source=specialist-tb-article&width=816',
    date: '21h ago',
  ),
  NewsModel(
    title:
        'UniCredit files legal challenge against ECB’s Russia exit directive; Revolut reports record £438mn profit',
    subtitle:
        'UniCredit announced on Monday that it has filed a legal challenge against a European Central Bank directive to speed up the withdrawal of its operations in Russia. The Italian lender was among several European banks to receive a letter from the ECB in May, ordering them to reduce their operations in the country. ',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/unicredit-logo/13180363-1-eng-GB/Unicredit-logo.jpg?source=specialist-tb-article&width=816',
    date: '20h ago',
  ),
  NewsModel(
    title:
        'US banks boost dividends after Fed stress test success; Morgan Stanley latest to scrap UK bonus cap',
    subtitle:
        'US banking giants Bank of America, Citigroup, Morgan Stanley and JPMorgan announced plans on Friday to return excess capital to shareholders through increased dividend payouts and hinted at substantial future stock buybacks after  the Federal Reserve’s annual stress tests last week. ',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/us-bank-logos-3/13201195-1-eng-GB/US-bank-logos-3.jpg?source=specialist-tb-article&width=816',
    date: '19h ago',
  ),
  NewsModel(
    title:
        'BoE warns on high-risk loans to private equity-backed firms; Australia approves ANZ’s \$3.3bn Suncorp Bank deal',
    subtitle:
        'Defaults on loans to high-risk borrowers have skyrocketed by 250 per cent, according to the Bank of England’s latest Financial Stability Report. Global defaults on leveraged loans have risen from 2 to 7 per cent since early 2022, with 73 per cent of these loans tied to private equity-backed firmsThough defaults have not yet reached the 12 per cent peak seen during the financial crisis, the BoE is concerned about potential economic spillovers from the private equity sector, which now finances around 10 per cent of the UK’s private sector workforce.',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/bank-of-england-facade/13007466-1-eng-GB/Bank-of-England-facade.jpg?source=specialist-tb-article&width=816',
    date: '18h ago',
  ),
  NewsModel(
    title:
        'Reporting Russian-owned transactions will challenge banks, say experts',
    subtitle:
        'EU banks will struggle to trace the flow of indirect financial transfers in line with new reporting requirements laid out by the European Commission, experts say.Under the obligations, described in the new Article 5r of rules originally created in 2014 to address Russia\'s actions in Ukraine, EU banks must produce biannual reports on all funds transferred from an EU entity to any non-EU country, where transactions exceed €100,000 and originate from a Russian-owned entity.',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/eu-commission-flags/13200645-1-eng-GB/EU-commission-flags.jpg?source=specialist-tb-article&width=816',
    date: '15h ago',
  ),
  NewsModel(
    title: 'Central banks need to get ‘attuned’ to AI, says BIS',
    subtitle:
        'Central banks must embrace artificial intelligence to better manage national economies, while remaining mindful of the risks posed by data biases and increased cyber security attacks, according to the Bank for International Settlements’ head of research.Central banks need to be “attuned” to the dynamics of AI, said Hyun Song Shin in a speech on Sunday during the launch of the BIS 2024 ',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/bis-hq-and-circuitry/13201891-1-eng-GB/BIS-HQ-and-circuitry.jpg?source=specialist-tb-article&width=816',
    date: '14h ago',
  ),
  NewsModel(
    title: 'New US rule on bank resolution under fire',
    subtitle:
        'The Federal Deposit Insurance Corporation’s new rule to strengthen banks’ comprehensive resolution strategies has been criticised as “impractical” and insufficient to prevent further US bank failures, with pushback even coming from within the regulator’s senior ranks.',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/fdic-plaque/12720052-1-eng-GB/FDIC-plaque.jpg?source=specialist-tb-article&width=816',
    date: '14h ago',
  ),
  NewsModel(
    title:
        'US banks face shortage of analysts who can spot bad loans, warns regulator',
    subtitle:
        'A US financial regulator has warned that the number of analysts in banks who can spot bad loans has dropped over time. The Office of the Comptroller of the Currency flagged the issue in its spring report on the federal banking system.',
    image:
        'https://www.ft.com/__origami/service/image/v2/images/raw/https://www.thebanker.com/var/ezflow_site/storage/images/media/images/office-of-the-comptroller-of-the-currency/13112205-1-eng-GB/Office-of-the-comptroller-of-the-currency.jpg?source=specialist-tb-article&width=816',
    date: '13h ago',
  ),
];
