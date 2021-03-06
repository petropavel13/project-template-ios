# project-template-ios

## Разворачивание нового проекта

### Шаг 1. Настройка конфигурации.

- Создать в аккаунтах разработчика AppID с имененем проекта в нижнем регистре. При генерации проекта создаются 4 базовых конфигурации:
	- StandardDebug, StandardRelease - для них использовать префикс `ru.touchin. + ИМЯ_ПРОЕКТ_В_НИЖНЕМ_РЕГИСТРЕ`. Аккаунт `apple@touchin.ru`
	- EnterpriseDebug, EnterpriseRelease - для них использовать префикс `com.touchin. + ИМЯ_ПРОЕКТ_В_НИЖНЕМ_РЕГИСТРЕ`. Аккаунт `enterpriseapple@touchin.ru`

- Создать `*.mobileprovision` для разработки (в случае Standard) и для развертывания (в случае Enterprise)

- Убедиться, что для проекта созданы необходимые репозитории (`ios` и `common`)

### Шаг 2. Настройка окружения

*Необходимо поставить ruby версии 2.4.0 и выше!*

Необходимо убедиться, что на вашей локальной машине стоит ruby version 2.4+. Это можно сделать командой

```
ruby -v
```

Если версия меньше, то в консоли необходимо выполнить следующие команды

```sh
xcode-select --install
```

```sh
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

После этого закройте терминал и откройте заново.
Убедитесь, что версия ruby стала 2.4+. Если не сработало, то выполните команду

```
rvm use ruby-2.4.0
```

- Установить сборщик зависимостей через команду

```sh
gem install bundle
```

### Шаг 3. Запуск скрипта развертки проекта

Очень важно **НЕ ПЕРЕПУТАТЬ!!!** порядок параметров.

```sh
./bootstrap.sh ПАРАМЕТР_1 ПАРАМЕТР_2 ПАРАМЕТР_3
```

Параметры:

- ПАРАМЕТР_1 = Родительская папка для расположения проекта, в ней будет создана папка проекта.
- ПАРАМЕТР_2 = Имя проекта. Папка проекта будет создана с постфиксом `-ios`.

> Пример: если ПАРАМЕТР_2 называется `Bank`, то папка проекта будет называться `Bank-ios`. Уже внутри папки проекта уже будут находится остальные файлы. Пример

```sh
├── Bank
│   ├── Analytics
│   ├── AppDelegate.swift
│   ├── Cells
│   ├── Controllers
│   ├── Extensions
│   ├── Generated
│   │   └── models.swift
│   ├── Info.plist
│   ├── Models
│   ├── Networking
│   ├── Protocols
│   ├── Realm
│   ├── Resources
│   │   ├── Assets.xcassets
│   │   │   └── AppIcon.appiconset
│   │   │       └── Contents.json
│   │   ├── LaunchScreen.storyboard
│   │   └── Localization
│   │       ├── Base.lproj
│   │       │   └── Localizable.strings
│   │       ├── String+Localization.swift
│   │       └── ru.lproj
│   │           └── Localizable.strings
│   ├── Services
│   │   ├── BankDateFormattingService.swift
│   │   ├── BankNumberFormattingService.swift
│   │   └── NavigationService.swift
│   └── Views
├── Bank.xcodeproj
├── Bank.xcworkspace
├── Downloads
├── Podfile
├── Podfile.lock
├── Pods
├── README.md
├── Rambafile
├── build-scripts
├── common
├── cpd-output.xml
└── fastlane
    └── Fastfile
```

- ПАРАМЕТР_3 (Опициональный) = Название репозитория с общими строками, без указания расширения `.git` и названия компании. Пример: `Bank-Common`, `Bank2-Common`. Если не указывать параметр, то будет использоваться имя проекта с постфиксом `-common`. Пример скрипта

```sh
igorkislyuk$ ./bootstrap.sh ~/Documents/projects/ Bank Bank-common
```

### Шаг 4. После установки:

- Используя сгенерированные провижены, выставить их для каждой конфигурации.
- *Опционально* при необходимости добавить конфигурации вручную.
- Открыть `Manage schemes` и выбрать корневую схему проекта. В графе "Container" выбрать workspace, а в графе "Shared" поставить напротив данной схемы галочку.
- Отркыть `Edit scheme`, и проставить необходимые build-configuration для действий (run, build, profile).
- В папке `common` cоздать папку `strings` (если такого еще нет), и в ней пустой файл `default_common_strings_ru.json` (или любая другая локализация, которая по-умолчанию используется на проекте).
- Настроить fabric (подробнее можно посмотреть [тут](https://github.com/TouchInstinct/Styleguide/blob/master/IOS/Guides/Fabric_Guide.md)).
- Собрать проект, убедиться, что все ок.
- Добавить сгенерированные файлы других локазаций `Localizable.string`, которые находятся в папках (например, `ru.lproj`) в файл проекта через **Add files to...**.
- Закоммитить и запушить все изменения в git. Создать PR из текущей ветки в `master`.
