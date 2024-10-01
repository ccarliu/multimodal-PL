#train_amos_atlas_fdeepoutgan_augrefine
CUDA_VISIBLE_DEVICES=1,2,3 python3 -u -m torch.distributed.launch --nproc_per_node=3 --master_port=$RANDOM train_amos_atlas_final.py \
--train_list='/list/MOTS/MOTS_train.txt' \
--val_list='/list/MOTS/MOTS_test.txt' \
--snapshot_dir='snapshots/amos_ours_77' \
--input_size='64,192,192' \
--batch_size=3 \
--num_gpus=3 \
--num_epochs=500 \
--start_epoch=0 \
--learning_rate=5e-4 \
--num_classes=14 \
--num_workers=6 \
--weight_std=True \
--random_mirror=True \
--random_scale=True \
--deep_up=True \
--weight_gan=0.001 \
--augmask=2 \
--seed=0 \
--pretrain_epoch=20 \
--reload_from_checkpoint=False \
--reload_path='/apdcephfs/share_1290796/lh/DoDNet/ours_final/snapshots/amos_ours_68/MOTS_DynConv_snapshots_e199.pth' \
--FP16=False >> ./run_files/amos_ours_77.txt # with attn loss