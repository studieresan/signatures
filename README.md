# signatures
Generates email signatures

## Setup

Install gems
```
$ bundle
```

Copy the example `people.yml` file
```
cp people.example.yml people.yml
```
Then add the contact info of your project members to `people.yml`.

### Environment variables
Fonts and assets are fetched from a CDN. Set the environment variable `CDN_URL` to a url pointing to your S3 bucket or similar.

## Usage

```
ruby generate.rb
```
This will write the email signatures to the `build/` folder. 

## Author
[@aronstrandberg](https://github.com/aronstrandberg)
