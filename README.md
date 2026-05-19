## Outer Wilds GRUB theme

Supported languages: Chinese (simplified), Chinese (traditional), English, French, German, Hungarian, Italian, Korean, Latvian, Norwegian, Polish, Portuguese, Russian, Rusyn, Spanish, Turkish, Ukrainian

Translations are generated using google translate, if you see a problem, feel free to open an issue.

![outergrub](https://github.com/user-attachments/assets/d8c49b1a-3624-4d32-a99f-fbec0e3502b9)


---


### Installation / update

  - Clone this repository and move to the directory:

    ```sh
    git clone https://github.com/Terofale/outer-wilds-grub-theme
    cd outer-wilds-grub-theme
    ```

  - Review the install.sh script and run it
    ```sh
    bash install.sh
    ```
  - Optional: edit the boot menu entries to make it centered horizontally and add the selectors (it should look like "⠀⠀⠀>Name<")
      - either edit the grub.cfg manually or use the renameEntries.sh script
      - I partially vibecoded the renameEntries script, my bash knowledge is too limited to do it on my own so if you don't trust it just edit the grub.cfg manually


<br>

You can use `--lang` option to select language and disable interactive language selection, e.g.:

```sh
bash install.sh --lang French   
```

<br>

Full list of languages see in `INSTALLER_LANGS` variable in [install.sh](install.sh)

---

### Uninstallation

run the uninstall.sh script

```sh
bash uninstall.sh
```

---

I used [this theme](https://github.com/AdrienZianne/ultrakill-grub-theme) as a base
