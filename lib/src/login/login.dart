import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_pyramid_task/core/consts/consts.dart';
import 'package:fourth_pyramid_task/core/public_models/public_models.dart';
import 'package:fourth_pyramid_task/core/shared_widgets/app_loader.dart';
import 'package:fourth_pyramid_task/core/utils/entrance_fader.dart';
import 'package:fourth_pyramid_task/core/utils/utils.dart';
import 'package:fourth_pyramid_task/src/injector.dart';
import 'package:fourth_pyramid_task/src/login/presentation/bloc/bloc.dart';

//DOMAIN
part 'domain/repositories/repository.dart';
part 'domain/use_cases/login_uc.dart';
part 'domain/entities/user_entity.dart';

//DATA
part 'data/repositories_impl/repository_impl.dart';
//PRESENTATION
part 'presentation/login_screen.dart';
part 'presentation/widgets/login_form.dart';
part 'presentation/widgets/paint.dart';
