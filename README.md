#Hello AWS KMS Ligthning Talk

Short talk covering field level encryption using wrapped data keys and AWS KMS.

##Live Demo

Build docker container
```
➜  hello-aws-kms git:(gh-pages) ✗ docker build -t aws-encryption-cli .
```

Run the aws encryption cli
```
➜  hello-aws-kms git:(gh-pages) ✗ docker run -it aws-encryption-cli aws-encryption-cli --help
```

##Acknowledgements and useful links

- Made with [deck.js](http://imakewebthings.github.com/deck.js)
- [Paranoid image](https://commons.wikimedia.org/wiki/File:Paranoia_HLM_logo.gif)
- [AWS Crypto CLI](https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/crypto-cli.html)
- [How Envelope Encryption Works](https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/how-it-works.html#envelope-encryption)
