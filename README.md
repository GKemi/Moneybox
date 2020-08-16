# Overview

This is my submission for the Moneybox technical task on iOS. I opted to follow the wireframe and consider adding little touches to the overall look of the app. I did not use any 3rd party libraries to get the task done, and instead aimed to make everything in-house so that the application would not have any external dependencies.

# Architectural Approach

## Overall Design

My general software design involves the use of MVP with a little mix of VIPER/Clean Architecture. Although an approach like VIPER is somewhat overkill for an application this small, I felt that it would be a good exercise. 

This approach may result in a somewhat larger quantity of files than typically necessary, but I specifically use the files as a means of applying the Single-Responsibility (S) principle from S.O.L.I.D. 

I also employed the use of Interface Segregation (I) by creating a single `NetworkClient` class which conforms to specific protocols for each screen/context.

## UI Components

UI Components are XIBs instead of storyboards - it's a personal style that I've been using for a while, and it's habitually my go-to approach. The main benefit of this approach, as it was originally explained to me, was the reduction of loading times that Storyboard files would otherwise provide, as well as encouraging a more programmatic approach for the elements.

## `User` being retrieved statically

Due to the simple nature of the task, I decided to store the `User` object statically and access it whenever necessary. In an ideal situation, I would not be making it a property that is globally accessible as it can hurt testability. If I had to refactor the way that this object is retrieved, I would most likely turn the `UserStore` into an abstraction for `UserDefaults` and persist the object, so that I could retrieve it afterwards in the `AccountDetails` module by calling a new instance of the `UserStore` class.

# Threading

When considering how to apply threading, I've recently begun experimenting with when the most appropriate time for thread-switching is. In my application I aimed to place every piece of logic related to the business/domain to run on a background thread, and having the UI thread get invoked at the end of the process. One of the benefits for doing this is to mitigate the potential for ANRs, as well as having a single point of failure for threading issues. It also left room for me to use `DispatchSemaphore` in the `NetworkClient` so that I could perform network calls that's similar to JavaScript's Async/Await feature.

# Tests

I didn't write many tests for this application due to time constraints, but those that were written employed the use of Gherkin/BDD-style Given-When-Thens to describe the behavior of the tests. I didn't follow through with standard TDD (i.e Red-Green-Refactor), and instead chose to test after implementation as I wanted to write as much of the app as I could.
