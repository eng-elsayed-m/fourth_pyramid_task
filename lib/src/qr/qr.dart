import 'package:dartz/dartz.dart' as dz;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_pyramid_task/core/consts/assets.dart';
import 'package:fourth_pyramid_task/core/consts/consts.dart';
import 'package:fourth_pyramid_task/core/consts/static_texts.dart';
import 'package:fourth_pyramid_task/core/public_models/public_models.dart';
import 'package:fourth_pyramid_task/core/shared_widgets/animated_swich.dart';
import 'package:fourth_pyramid_task/core/shared_widgets/app_loader.dart';
import 'package:fourth_pyramid_task/core/shared_widgets/asset_icon.dart';
import 'package:fourth_pyramid_task/core/utils/entrance_fader.dart';
import 'package:fourth_pyramid_task/core/utils/utils.dart';
import 'package:fourth_pyramid_task/src/injector.dart';
import 'package:fourth_pyramid_task/src/qr/data/sources/local_source.dart';
import 'package:fourth_pyramid_task/src/qr/presentation/bloc/bloc.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan/scan.dart';
import 'dart:io';

//domain

part 'domain/use_cases/get_results_uc.dart';
part 'domain/use_cases/save_result_uc.dart';
part 'domain/repositories/repository.dart';
part 'domain/entities/result_entity.dart';
part 'domain/use_cases/scan_qr_uc.dart';

//data
part 'data/repositories_impl/repository_impl.dart';
part 'data/sources/remote_source.dart';
//presentation
part 'presentation/widgets/sub_title_widget.dart';
part 'presentation/widgets/result_item.dart';
part 'presentation/widgets/title_widget.dart';
part 'presentation/widgets/results_widget.dart';
part 'presentation/widgets/scan_widget.dart';
part 'presentation/qr_screen.dart';
part 'presentation/widgets/paint.dart';
