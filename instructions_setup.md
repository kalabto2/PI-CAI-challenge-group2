1) follow instructions in README.md [here](https://github.com/DIAGNijmegen/picai_baseline) and setup `data` folder structure

    - `/input/` contains one of the [PI-CAI datasets](https://pi-cai.grand-challenge.org/DATA/). This can be the Public Training and Development Dataset, the Private Training Dataset, the Hidden Validation and Tuning Cohort, or the Hidden Testing Cohort.
      - `/input/images/` contains the imaging files. For the Public Training and Development Dataset, these can be retrieved [here](https://zenodo.org/record/6624726).
      - `/input/picai_labels/` contains the annotations. For the Public Training and Development Dataset, these can be retrieved [here](https://github.com/DIAGNijmegen/picai_labels).
    - `/workdir/` stores intermediate results, such as preprocessed images and annotations.
      - `/workdir/results/[model name]/` stores model checkpoints/weights during training (enables the ability to pause/resume training).    
    - `/output/` stores training output, such as trained model weights and preprocessing plan.

2) activate environment and move to the `data` folder and run everything from there

3) make splits

```bash
python -m picai_baseline.splits.picai_nnunet --output "./workdir/splits/picai_nnunet"
```

4) run preprocessing (file `prepare_data.py` should already be adjusted as described in README.md [here](https://github.com/DIAGNijmegen/picai_baseline/blob/main/unet_baseline.md))

```bash
sbatch preproc.sh
```

5) prepare plan overviews
```bash
python src/picai_baseline/unet/plan_overview.py
```

6) run training
```bash
sbatch train.sh
```
