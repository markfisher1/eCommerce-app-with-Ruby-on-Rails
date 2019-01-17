#Changelog
For better tutoring all significant changes will be kept under this log.

## [v0.7] > 4.5 > Add dynamic carousel for latest products & controller patch

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
