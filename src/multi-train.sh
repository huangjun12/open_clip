# encoding='utf-8'

# python -m training.main \
# cd src/
# 直接跑这里，就不用每次修改python setup.py install
# 导包可能有点问题，需要在main.py下加入以下代码:
## import时找到上级目录
## __dir__ = os.path.dirname(os.path.abspath(__file__))
## sys.path.append(__dir__)
## sys.path.insert(0, os.path.abspath(os.path.join( __dir__, "..")))

# torchrun提到hope上有点问题，跑不起来
# 可能有其它方式需要修一下？
# 或者改成lanuch启动，代码也需要适配下

# csv文件训练
torchrun --nproc_per_node 4 training/main.py \
    --save-frequency 1 \
    --zeroshot-frequency 1 \
    --train-data="hadoop-mtcv/huangjun43/mini-cc3m/train.csv"  \
    --val-data="hadoop-mtcv/huangjun43/mini-cc3m/test.csv"  \
    --csv-img-key image_path \
    --csv-caption-key text \
    --warmup 10000 \
    --batch-size=128 \
    --lr=1e-3 \
    --wd=0.1 \
    --epochs=30 \
    --workers=8 \
    --model RN50


# python training/main.py \
#     --save-frequency 1 \
#     --zeroshot-frequency 1 \
#     --train-data="hadoop-mtcv/huangjun43/mini-cc3m/train.csv"  \
#     --val-data="hadoop-mtcv/huangjun43/mini-cc3m/test.csv"  \
#     --csv-img-key image_path \
#     --csv-caption-key text \
#     --warmup 10000 \
#     --batch-size=128 \
#     --lr=1e-3 \
#     --wd=0.1 \
#     --epochs=30 \
#     --workers=8 \
#     --model RN50