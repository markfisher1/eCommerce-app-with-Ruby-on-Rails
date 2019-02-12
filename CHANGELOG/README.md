# Changelog  
For better tutoring all significant changes will be kept under this log.


## [v0.20 - 09/feb/19] > 5.6 > Add database diagram for the current state and further patch

### [v0.20 - 12/feb/19] > Image uploads & devise hotFix

- Install gem `carrierwaveuploader`.
- Patch `application controller` to enable some `User` parameters.
- Patch `product controller` to swap old `image_url` for `image` field.
- Assign temporary settings to `ability.rb`.
- Add two different DB migrations to handle the changes within schema.
- Recode `seeds` to enable the new `image` field and use it correctly.
- Patch the required views & partials to face the backEnd changes.
- Add `public/uploads` to `.gitignore` to avoid populate repository with environment related files.



## [v0.19 - 08/feb/19] > Add user data fields, patch login keys, profile & settings improvement

#### [v0.19.1 - 08/feb/19] > HotFix > require assets

- Add `profile.js` to the required asset tree.

#### [v0.19.0]

- Migrate database to increase number of user table fields.
- Add simple javascript interaction to `profile view` through `profile.js`.
- Patch notice & alert animations.
- Re-organise bootstrap overrides into a single stylesheet file.
- Patch stylesheets to face the new views and organisation.
- Patch application controller to better enhance devise functionality.
- Override default `registrations controller` to allow different redirection upon update.
- Patch `users controller` to populate `profile view` accordingly.
- Patch `orders helper` to enable bootstrap tooltips on icons.
- Patch `user model` & `devise initializer` to enable multiple login keys (email & username).
- Patch `devise` default views and style accordingly.
- Patch `layout` to enable `flash[:stuff]`.
- Patch default `routes` to enable several `post` requests related with orders and to define login `root path`.

## [v0.18 - 07/feb/19] > Fix authorisation issues

- Block user from viewing: `/users/`, `/users/edit`, `users/new`.

## [v0.17 - 07/feb/19] > 5.5 > User authorisation

- Install gem `cancancan`.
- Patch minimal authorisations for users.
- Allow users to view only their own profile page.
- Allow users to view only their own orders.
- Deny users to edit products but allow them to view them.
- Patch orders `controller` to filter results by `user_id` and `paid` status.
- Add alert notice boxes to inform users of server response.
- Patch small fixes on user registration/editing and login forms.

## [v0.16 - 06/feb/19] > Fix login error message display

## [v0.16 - 06/feb/19] > 5.4 > User authentication & account managing view styling

- Install gem `devise`.
- Add `devise` views and style them with responsive layout.
- Patch `environment` configuration to style default rails DOM interactions for error display.
- Patch `routes` to enable new get and post requests related with account creation and managing.
- Create `typography` stylesheet file to prepare a common place to group all font interactions.
- Patch `orders` controller to require user authentication before any action.
- Enable user registration and login system.

## [v0.15 - 05/feb/19] > Mailer switch to private domain

- Patch environment to use private domain as email server instead of sendgrid plugin.

## [v0.14 - 05/feb/19] > 5.3 > Mailers

- Add responsive contact form.
- Add `ActionMailer` to handle email delivery.
- Add simple email template.

## [v0.13 - 05/feb/19] > 5.2 > Search form, GET requests & Carousel small fix

- Add search box to locate similar entries.
- Style search box with bootstrap classes.
- Redirect to product list row anchor when submitting search.
- Fix carousel controls height to avoid overlap over divs below.

## [v0.12 - 04/feb/19] > 5.1 > Reroute & Redirect

- Switch root from webApp for products view.
- Change redirect path on products successful actions.

## [v0.11] > Optimisation and code cleanup

- Move `JS` external libraries to `vendor/assets/javascripts`.
- Cleanup `application.scss`.
- Patch data display format with callbacks and remove redundant code.
- Add helper to handle `Orders` status icons.
- Use `routes.rb` established paths on `orders index` to avoid location errors.
- Patch `routes.rb` to remove unused call for `orders/#show`.
- Rename and patch `_products_display` to `_product` and use rails association to fetch `Product` controller.
- Patch landing page to reduce needed logic into minimalistic readable entries.

## [v0.11] > 4.7 > Responsive layout for products, patch controllers & linking

- Add responsive view for single products.
- Patch product controller to sanitise output.
- Add direct linking for singular product page through carousel images & product table images.

## [v0.10] > 4.6 > Order Controller and Views

- Add views for orders index and show pages.
- Make referred output responsive.
- Patch `seed.rb` to face dummy orders by default.

## [v0.9] > Carousel dynamic sizing & Controls

### [v0.9.3] > Code cleanup with variables at products.scss

### [v0.9.2] > Fix carousel height on small devices

### [v0.9.1]
- Format carousel caption content according to different screen sizes.
- Remove scale effect from carousel controls on small screens.

## [v0.8] > Carousel styling & Control on swipe

- Position text to the right on carousel's price tag.
- Add swipe left / right as carousel control.
- Integrate plugin jQuery touchSwipe.

## [v0.7] > 4.5 > Add dynamic carousel for latest products & controller patch

### [v0.7.2] > Fix javascript concatenation II > Heroku fail to compile

### [v0.7.1] > Fix javascript concatenation & delete trash file

### [v0.7.0]
- Add dynamic carousel to display the newest items on the shop.
- Patch simple_pages controller & product controller to sanitise output data to face needs.
- Migrate css variables to stylesheets/variables.css.
- Style featured products' carousel.
- Break views into partial renders for better organisation.
- Sanitise output from products & simple_pages controllers.

## [v0.6.4] > Fix product image nil scenarios

- Fix exception where product image data-attribute was nil due to lack of image.

## [v0.6.3] > Define default product picture

- Attribute default product picture if none is found in our records.
- Patch seed to include scenarios without picture.

## [v0.6.2] > Fix asynchronous loading of product images

- Patch asynchronous script to face production environment.

## [v0.6.1] > Fix pipeline asset

- Fix javascript syntax to face asset pipeline requirements and avoid errors.

## [v0.6] > 4.4 > Icon fix, Product image async loading script & orders DB structure

- Fix webApp icon positioning.
- Add order model.
- Update product model.
- Apply DB migration to design the structure for order table.
- Prepare DB seed to avoid entry duplication on initial dummy content.
- Add JavaScript asynchronous loading script to product images.
- Associate Order & Product classes.
- Update graphical content.

## [v0.5] > 4.3 > Add manual controller & actions for orders view

- Add controller and actions to handle orders view without using rails generator.
- Enable order index view on routes.
- Enable order show on routes.

## [v0.4] > 4.2 > Database Migrations

- Add migration to insert price field.
- Add migration to rename colour field to colour.
- Add seed to populate db.
- Design basic responsive product display layout.

## [v0.3] > 4.1 > Scaffolding products

- Create db table and respective model to handle data.
- Design the product table list and add product form.
- Added product dummy listings.
- Require css tree after custom css styling.
- Require js tree after custom js import.
- Fix routes.rb to avoid redundant call.

## [v0.2] > Handle database environment

- Enable PostgresSQL for production;
- Enable Sqlite3 for development;

## [v0.1] > Link Bootstrap, add menu and footer, display images

- Enable bootstrap gem;
- Define navigation on global layout;
- Style navigation and footer elements;
- Display responsive images using ruby methods;
