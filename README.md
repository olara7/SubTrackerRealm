# SubTrackerRealm

## Overview

<img width="1349" alt="Screen Shot 2022-01-20 at 1 07 05 PM" src="https://user-images.githubusercontent.com/54912970/150422290-ffdcd111-5a58-4b95-83c1-20cce8e83ede.png">

<img width="1349" alt="Screen Shot 2022-01-20 at 12 53 12 PM" src="https://user-images.githubusercontent.com/54912970/150420556-475a76a9-001a-4165-9145-bf287ccc2d7e.png">

### Description
##### Technologies used: SwiftUI | Realm

This app is a subscription tracker with a neumorphic design that tracks the subsciptions of the user.

## Stories

### User can view added subscriptions

Light Mode <img src="https://user-images.githubusercontent.com/54912970/150310224-cac84f5f-9ab1-4a1b-a69c-a50638130589.png" width="250" height="530" /> Dark Mode <img src="https://user-images.githubusercontent.com/54912970/150319634-0a8ee86d-28e2-4237-92bc-9cdc6016b92c.png" width="250" height="530" />

### User can create a subscription

Light Mode <img src="https://user-images.githubusercontent.com/54912970/150313491-e03b984b-2eeb-4580-b464-adac79ab2ef8.gif" width="250" height="530" /> Dark Mode <img src="https://user-images.githubusercontent.com/54912970/150313126-9c21e731-eac5-44cc-bb65-0bd4cf25027c.gif" width="250" height="530" />

### User can mark the subscription as active or inactive
- This will sort the subscriptions by active and then by date.

Light Mode <img src="https://user-images.githubusercontent.com/54912970/150315436-c25adcb7-57e1-4b4a-9c55-ddc0c348dec8.gif" width="250" height="530" /> Dark Mode <img src="https://user-images.githubusercontent.com/54912970/150316519-0d923c2e-372d-43be-9545-8a2fcd9276b6.gif" width="250" height="530" />

### User can delete a subscription

Light Mode <img src="https://user-images.githubusercontent.com/54912970/150318046-a929aa35-5f18-44c4-8888-e804521230c2.gif" width="250" height="530" /> Dark Mode <img src="https://user-images.githubusercontent.com/54912970/150317920-c0e4fbdf-edf4-49eb-bc92-4ae06b55df9e.gif" width="250" height="530" />

### Subscription Model
- Sub Model
  - id : to identify the subscription, created automatically by Realm
  - title : subscription title
  - price : subscription price
  - active : true if subscription is active, false if subscription is inactive
  - renewDay : renewal day of the subscription
