# dotfiles

## Getting Started

```
mkdir -p github.com/onelharrison

cd github.com/onelharrison

git clone --recurse-submodules https://github.com/onelharrison/dotfiles.git

cd dotfiles

./setup.sh
```

## TODO

* Support programming with Racket
    * Install Racket
    * Install [racket-language-server](https://github.com/theia-ide/racket-language-server)
* Improve editing experience for Jenkinsfiles
    * Install [npm-groovy-lint](https://github.com/nvuillam/npm-groovy-lint)
* Support programming with docker
    * Install docker
    * Install [hadolint](https://github.com/hadolint/hadolint) for linting Dockerfiles
* Improve overall terminal experience
    * Install [bat](https://github.com/sharkdp/bat) (cat alternative)
    * Install [fzf](https://github.com/junegunn/fzf) (+ vim plugin)
    * Add git symbols to command prompt
* Support vim config overrides that aren't version controlled
