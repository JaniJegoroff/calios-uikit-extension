[![Gem Version](https://badge.fury.io/rb/calios-uikit-extension.svg)](http://badge.fury.io/rb/calios-uikit-extension)
[![Dependency Status](https://gemnasium.com/JaniJegoroff/calios-uikit-extension.svg)](https://gemnasium.com/JaniJegoroff/calios-uikit-extension)

calios-uikit-extension
==========

Calabash-ios UIKit extension provides convenient metaclasses for Calabash usage.

You can utilise these classes in `calabash-ios console` as well as in your test automation code.

See similar extension for Calabash-android: [calandroid-widget-extension](https://github.com/JaniJegoroff/calandroid-widget-extension)

Installation
==========

In your Gemfile:

`gem 'calios-uikit-extension'`

Install gem manually:

`$ gem install calios-uikit-extension`

Supported UIKit elements
==========

Currently small subset of UIKit elements are supported. Supported UIKit elements are:

`UIButton`
`UICollectionView`
`UICollectionViewCell`
`UIKeyboardAutomatic`
`UILabel`
`UINavigationBar`
`UISearchBar`
`UISegmentedControl`
`UISwitch`
`UITableView`
`UITableViewCell`
`UITextField`
`UIView`

Example use cases
==========

Launch calabash-ios console (irb)

`$ calabash-ios console`

Load calios-uikit-extension

`irb> require 'calios-uikit-extension'`

Launch your application

`irb> start_test_server_in_background`

Execute some example Calabash and equivalent `calios-uikit-extension` commands

`query('view')`
> **`UIView.query`**

`query("view marked:'myId'")`
> **`UIView.query('myId')`**

`query('label index:0', :text).first`
> **`UILabel.text`**

`query('label index:1', :text).first`
> **`UILabel.text(1)`**

`touch('button')`
> **`UIButton.touch`**

`touch('button index:1')`
> **`UIButton.touch(1)`**

`touch("button marked:'buttonId'")`
> **`UIButton.touch('buttonId')`**

`flash("button marked:'buttonId'")`
> **`UIButton.flash('buttonId')`**

`query('label', :font)`
> **`UILabel.property(:font)`**

`query("button marked:'buttonId'", :currentTitle).first`
> **`UIButton.text('buttonId')`**

`query('switch', :isOn).first.to_boolean`
> **`UISwitch.on?`**

`query('tableViewCell').count`
> **`UITableViewCell.count`**

`query('collectionView', numberOfItemsInSection:0).first`
> **`UICollectionView.number_of_items_in_section`**

`query('collectionView', numberOfItemsInSection:1).first`
> **`UICollectionView.number_of_items_in_section(1)`**

`scroll('collectionView', :left)`
> **`UICollectionView.scroll(:left)`**

`scroll('tableView', :down)`
> **`UITableView.scroll(:down)`**

`scroll_to_collection_view_item(1, 0, {scroll_position: :left})`
> **`UICollectionView.scroll_to_item(1, 0, :left)`**

See available methods for a certain metaclass

> **`UIButton.help`**

Did you notice alias methods?

> **`UIButton.help`** --> **`UIButton.h`**

> **`UIButton.query`** --> **`UIButton.q`**

> **`UIButton.flash`** --> **`UIButton.f`**

> **`UIButton.property`** --> **`UIButton.prop`** --> **`UIButton.p`**

> **`UIButton.touch`** --> **`UIButton.tap`**

Okay, I think you got the point. Time to utilise `calios-uikit-extension` methods in your test automation code now!

Run the tests
==========

`$ bundle`

`$ rake`

License
==========

MIT
