# Безпечна Збірка

## Огляд Практик Безпеки

Практика Безпечної Збірки (БЗ) підкреслює важливість створення програмного забезпечення стандартизованим, повторюваним способом та використання безпечних компонентів, включно з залежностями програмного забезпечення третіх сторін.

Перший потік зосереджується на усуненні будь-якої суб'єктивності з процесу збірки, прагнучи до повної автоматизації. Автоматизований конвеєр збірки може включати додаткові автоматизовані перевірки безпеки, такі як SAST і DAST, щоб забезпечити подальші гарантії та своєчасно виявляти регресії безпеки, наприклад, зупиняючи процес збірки.

Другий потік визнає поширеність залежностей програмного забезпечення в сучасних додатках. Він прагне їх ідентифікувати та відстежувати їхній статус безпеки, аби обмежити вплив їхньої небезпеки на інакше безпечний додаток. В розвинутій формі він застосовує подібні перевірки безпеки до залежностей програмного забезпечення, як і до самого додатка.

## Огляд Потоків

### Потік А - Процес Збірки

Послідовний процес збірки забезпечує передбачуваність програмного забезпечення, яке ви розгортаєте, і пряме зв'язування з вихідним кодом. Крім того, ви можете скористатися процесом збірки програмного забезпечення для різних заходів безпеки.

### Потік Б - Залежності Програмного Забезпечення

Зовнішні бібліотеки є значною частиною сучасного програмного забезпечення. Заходи в цьому напрямку допомагають створити огляд зовнішніх бібліотек та забезпечити адекватну силу їхньої безпеки.

## Огляд Заходів

<table>
    <thead>
        <tr>
            <th style="text-align: center">Потік А<br>Процес Збірки</th>
            <th style="text-align: center">Потік Б<br>Залежності Програмного Забезпечення</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan=2 style="text-align: center">
                Рівень Зрілості 1<br>Процес збірки є повторюваним і послідовним.
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                Створіть формальне визначення процесу збірки, щоб він став послідовним і повторюваним.
            </td>
            <td style="text-align: center">
                Створюйте записи зі Списком Матеріалів ваших додатків та опортуністично аналізуйте їх.
            </td>
        </tr>
        <tr>
            <td colspan=2 style="text-align: center">
                Рівень Зрілості 2<br>Процес збірки оптимізований і повністю інтегрований у робочий процес.
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                Автоматизуйте ваш конвеєр збірки та забезпечте безпеку використовуваного інструментарію. Додайте перевірки безпеки у конвеєр збірки.
            </td>
            <td style="text-align: center">
                Оцінюйте використані залежності та забезпечуйте своєчасну реакцію на ситуації, які становлять ризик для ваших додатків.
            </td>
        </tr>
        <tr>
            <td colspan=2 style="text-align: center">
                Рівень Зрілості 3<br>Процес збірки допомагає запобігти входженню відомих дефектів у виробниче середовище.
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                Визначте обов'язкові перевірки безпеки в процесі збірки та забезпечте, що збірка невідповідних артефактів зупиняється.
            </td>
            <td style="text-align: center">
                Аналізуйте використані залежності на предмет проблем безпеки подібно до аналізу вашого власного коду.
            </td>
        </tr>
    </tbody>
</table>

## Потік А - Процес Збірки

### Рівень Зрілості 1

#### Перевага

Обмежений ризик людської помилки під час процесу збірки, що мінімізує проблеми безпеки

#### Заходи

Визначте процес збірки, розділивши його на набір чітких інструкцій для виконання людиною або автоматизованим інструментом. Визначення процесу збірки описує весь процес від початку до кінця, так щоб людина або інструмент могли послідовно його слідувати кожного разу та виробляти однаковий результат. Визначення зберігається централізовано і доступне для будь-яких інструментів чи людей. Уникайте зберігання кількох копій, оскільки вони можуть стати несинхронізованими та застарілими.

Визначення процесу не містить жодних секретів (особливо враховуючи ті, що необхідні під час процесу збірки).

Перегляньте всі інструменти збірки, переконайтеся, що вони активно підтримуються постачальниками
та оновлювалися за допомогою патчів безпеки. Покращуйте конфігурацію кожного інструменту, щоб
щоб вона відповідала рекомендаціям постачальника та найкращим галузевим практикам.

Визначте значення для кожного згенерованого артефакту, яке згодом можна буде використати для перевірки його цілісності
наприклад, підпис або хеш. Захистіть це значення і, якщо артефакт підписаний, приватний сертифікат підпису.

Переконайтеся, що інструменти збірки регулярно виправляються та належним чином загартовуються.

|Чи описаний ваш повний процес збірки формально?|
|---|

|Критерії якості|
|---|
|- Ви маєте достатньо інформації для відтворення процесів збірки|
|- Ваша документація збірки актуальна|
|- Ваша документація збірки зберігається в доступному місці|
|- Під час збірки створюються контрольні суми артефактів для підтримки подальшої перевірки|
|- Ви зміцнюєте інструменти, які використовуються в процесі збірки|

|Відповіді|
|---|
|Ні|
|Так, для деяких додатків|
|Так, принаймні для половини додатків|
|Так, для більшості або всіх додатків|

### Рівень Зрілості 2

#### Перевага

Ефективний процес збірки з інтегрованими інструментами безпеки

#### Заходи

Автоматизуйте процес збірки так, щоб збірки могли бути виконані послідовно в будь-який час. Процес збірки зазвичай не повинен вимагати будь-якого втручання, що далі зменшує ймовірність людської помилки.

Використання автоматизованої системи підвищує залежність від безпеки інструментів збірки і робить їх зміцнення та підтримку ще більш критичним. Особливу увагу зверніть на інтерфейси цих інструментів, такі як веб-портали, та як їх можна заблокувати. Витік інструмента збірки в мережу може дозволити зловмиснику втрутитися в цілісність процесу. Це, наприклад, може дозволити вбудувати шкідливий код у програмне забезпечення.

Автоматизований процес може вимагати доступу до облікових даних і секретів, необхідних для збірки програмного забезпечення, таких як сертифікат підпису коду або доступ до репозиторіїв. Обережно з ними поводьтеся. Підписуйте створені артефакти, використовуючи сертифікат, який ідентифікує організацію або бізнес-одиницю, яка його побудувала, щоб ви могли перевірити його цілісність.

Наостанок, додайте відповідні автоматизовані перевірки безпеки (наприклад, використовуючи інструменти SAST) в конвеєр, щоб використовувати автоматизацію для підвищення безпеки.

|Чи повністю автоматизовано процес збірки?|
|---|

|Критерії якості|
|---|
|- Сам процес збірки не вимагає людського втручання|
|- Ваші інструменти збірки зміцнені згідно з кращими практиками та рекомендаціями постачальника|
|- Ви шифруєте секрети, необхідні для інструментів збірки, та контролюєте доступ на основі принципу найменшого привілею|

|Відповіді|
|---|
|Ні|
|Так, для деяких додатків|
|Так, принаймні для половини додатків|
|Так, для більшості або всіх додатків|

### Рівень Зрілості 3

#### Перевага

Гарантія того, що ви створюєте програмне забезпечення, яке відповідає базовому рівню безпеки

#### Заходи

Визначте перевірки безпеки, які доцільно здійснювати під час процесу збірки, а також
а також мінімальні критерії для проходження збірки - вони можуть відрізнятися залежно від
профілів ризику різних додатків. Включіть відповідні перевірки безпеки
у збірку і примусово переривайте процес збірки, якщо попередньо визначені
критерії не дотримано. Запускайте попередження для проблем нижче порогового рівня та реєструйте їх у централізованій системі для відстеження
їх до централізованої системи для відстеження та вжиття заходів. Якщо це доцільно,
впровадити механізм винятків, щоб обійти цю поведінку, якщо ризик певної вразливості
певної вразливості було прийнято або зменшено. Однак, переконайтеся, що такі випадки
випадки спочатку чітко схвалені та реєструйте їх виникнення разом з
обґрунтуванням.

Якщо технічні обмеження не дозволяють організації зламати збірку автоматично
автоматично, забезпечте той самий ефект за допомогою інших заходів, таких як чітка
політики та регулярного аудиту.

Обробляйте підписання коду на окремому централізованому сервері, який не розкриває сертифікат системі, що виконує
сертифікат системі, яка виконує збірку. Де це можливо, використовуйте
детермінований метод, який видає відтворювані артефакти байт за байтом.

|Чи застосовуєте ви автоматизовані перевірки безпеки в процесах збірки?|
|---|

|Критерії якості|
|---|
|- Збірка не пройде, якщо додаток не відповідає попередньо визначеній базі безпеки|
|- У вас є максимально прийнятний рівень серйозності вразливостей|
|- Ви реєструєте попередження та помилки в централізованій системі|
|- Ви вибираєте та налаштовуєте інструменти для оцінки кожного додатка щодо його вимог безпеки принаймні раз на рік|

|Відповіді|
|---|
|Ні|
|Так, для деяких додатків|
|Так, принаймні для половини додатків|
|Так, для більшості або всіх додатків|

## Потік Б - Залежності Програмного Забезпечення

### Рівень Зрілості 1

#### Перевага

Доступна інформація про відомі проблеми безпеки в залежностях

#### Заходи

Ведіть облік усіх залежностей, які використовуються в цільовому виробничому середовищі. Іноді це називають Списком Матеріалів (BOM). Враховуйте, що різні компоненти програми можуть використовувати зовсім різні залежності. Наприклад, якщо програмний пакет є веб-додатком, охопіть як код серверної частини додатка, так і клієнтські сценарії. При створенні цих записів враховуйте різні місця, де можуть бути вказані залежності, такі як файли конфігурації, директорія проекту на диску, інструмент управління пакетами або фактичний код (наприклад, через IDE, яке підтримує перелік залежностей).

Зберіть наступну інформацію про кожну залежність:

- Де вона використовується або на яку посилається
- Використовувана версія
- Ліцензія
- Інформація про джерело (посилання на репозиторій, ім'я автора тощо)
- Статус підтримки та обслуговування залежності

Перевірте записи, щоб виявити будь-які залежності з відомими вразливостями,
та оновіть або замініть їх відповідно.

|Чи маєте ви міцні знання про залежності, на які ви покладаєтесь?|
|---|

|Критерії якості|
|---|
|- У вас є актуальний список матеріалів (BOM) для кожного додатка|
|- Ви можете швидко дізнатися, які додатки вплинуті конкретним CVE|
|- Ви проаналізували, вирішили та задокументували висновки щодо залежностей принаймні раз за останні три місяці|

|Відповіді|
|---|
|Ні|
|Так, для деяких додатків|
|Так, принаймні для половини додатків|
|Так, для більшості або всіх додатків|

### Рівень зрілості 2

#### Перевага

Повна прозорість відомих проблем безпеки у залежностях

#### Заходильність

Оцінювати використані залежності та створювати список прийнятних, затверджених до використання у проекті, команді або в ширшій організації згідно з визначеним набором критеріїв.

Впровадити центральний репозиторій залежностей, з якого можна будувати все програмне забезпечення.

Регулярно переглядати використані залежності, щоб переконатися, що:

- вони залишаються правильно ліцензованими
- відсутні відомі та значні вразливості, що впливають на ваші додатки
- залежність все ще активно підтримується та оновлюється
- ви використовуєте актуальну версію
- є вагома причина включити залежність

Своєчасно та адекватно реагувати на невідповідності, обробляючи їх як дефекти. Розгляньте можливість використання автоматизованого інструменту для сканування вразливих залежностей та призначення ідентифікованих проблем відповідним розробницьким командам.

|Чи обробляєте ви ризик залежності від третіх сторін за допомогою формального процесу?|
|---|

|Критерії якості|
|---|
|- Ви підтримуєте список затверджених залежностей, які відповідають попередньо визначеним критеріям|
|- Ви автоматично оцінюєте залежності на наявність нових CVE та сповіщаєте відповідальних працівників|
|- Ви автоматично виявляєте зміни ліцензій, які можуть вплинути на законне використання програми, та надсилаєте сповіщення|
|- Ви відстежуєте та сповіщаєте про використання не підтримуваних залежностей|
|- Ви надійно виявляєте та видаляєте непотрібні залежності з програмного забезпечення|

|Відповіді|
|---|
|Ні|
|Так, для деяких додатків|
|Так, принаймні для половини додатків|
|Так, для більшості або всіх додатків|

### Рівень зрілості 3

#### Перевага

Обробка проблем безпеки в залежностях порівнянно з тими, що у власному коді

#### Заходи

Підтримувати білий список затверджених залежностей та версій, та забезпечувати, щоб процес збірки не вдавався при наявності залежності, яка не знаходиться у списку. Включити процес підпису для обробки винятків до цього правила, якщо це розумно.

Виконуйте перевірки безпеки щодо залежностей з білого списку порівняно з цільовими додатками (особливо використовуючи SAST та аналізуючи транзитивні залежності). Переконайтесь, що ці перевірки також мають на меті ідентифікацію можливих задвірок або пасхалок у залежностях. Встановіть процеси розкриття вразливостей з авторами залежностей, включно з SLA для усунення проблем. У випадку, коли дотримання SLA не є реалістичним (наприклад, з вразливостями у відкритому коді), переконайтесь, що найбільш імовірні випадки передбачені та ви здатні вчасно впровадити компенсуючі заходи. Реалізуйте регресивні тести для усунення виявлених проблем.

Відстежуйте всі ідентифіковані проблеми та їх стан за допомогою вашої системи відстеження дефектів. Інтегруйте вашу збірочну лінійку з цією системою, щоб дозволити збій збірки, коли включені залежності містять проблеми вище визначеного рівня критичності.

|Чи запобігаєте ви збірці програмного забезпечення, якщо воно постраждало від вразливостей у залежностях?|
|---|

|Критерії якості|
|---|
|- Ваша система збірки підключена до системи відстеження ризиків залежності третіх сторін, що спричиняє збій збірки, якщо вразливість оцінена як хибнопозитивна або ризик явно прийнятий|
|- Ви скануєте свої залежності за допомогою інструменту статичного аналізу|
|- Ви повідомляєте про виявлення авторам залежностей, використовуючи встановлений процес відповідального розкриття|
|- Використання нової залежності, що не оцінена на предмет ризиків безпеки, спричиняє збій збірки|

|Відповіді|
|---|
|Ні|
|Так, для деяких додатків|
|Так, принаймні для половини додатків|
|Так, для більшості або всіх додатків|