# Hello AWS KMS Ligthning Talk

Short talk covering field level encryption using wrapped data keys and AWS KMS.

## Live Demo

Build docker container
```
➜  hello-aws-kms git:(gh-pages) ✗ docker build -t aws-encryption-cli .
```

Authenticate to an AWS Account

Create Customer Master Key
```
➜  hello-aws-kms git:(gh-pages) ✗ aws kms create-key --description "krut's test key"
```
Note the arn from the create key, we'll pass this in to the following command.

Encrypt your file with the aws encryption cli to encrypt your file (make sure you replace the key= section with the key you generated above)
```
➜  hello-aws-kms git:(gh-pages) ✗ docker run -e AWS_REGION=us-west-1 -e AWS_DEFAULT_REGION=us-west-1 -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -it -v "$PWD":/usr/local/app -w /usr/local/app aws-encryption-cli --encrypt --input="./images/mo-photo.jpg" --output="./output/mo-photo.encrypted.jpg" --metadata-output="./output/mo-metadata.txt" --master-keys "key=1234abcd-12ab-34cd-56ef-1234567890ab"
```

Decrypt the file, not the absence of the master key because KMS is smart enough to figure it out :)
```
➜  hello-aws-kms git:(gh-pages) ✗ docker run -e AWS_REGION=ap-southeast-2 -e AWS_DEFAULT_REGION=ap-southeast-2 -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -it -v "$PWD":/usr/local/app -w /usr/local/app aws-encryption-cli --decrypt --input="./output/mo-photo.encrypted.jpg" --output="./output/mo-photo.decrypted.jpg" --metadata-output="./output/mo-metadata.txt"
```

Cleanup after yourself by deleting the CMK.  *CAUTION!* Only do this to your own temporary key, read <a href='http://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html#deleting-keys-scheduling-key-deletion-cli'>Deleting Customer Master Keys</a> if you want more details.
```
➜  hello-aws-kms git:(gh-pages) ✗ aws kms schedule-key-deletion --key-id 1234abcd-12ab-34cd-56ef-1234567890ab --pending-window-in-days 1
```

## Acknowledgements and useful links

- Made with [deck.js](http://imakewebthings.github.com/deck.js)
- [Paranoid image](https://commons.wikimedia.org/wiki/File:Paranoia_HLM_logo.gif)
- [AWS Crypto CLI](https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/crypto-cli.html)
- [How Envelope Encryption Works](https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/how-it-works.html#envelope-encryption)
