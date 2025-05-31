part of 'installation_wizard_bloc.dart';

class InstallationWizardState extends Equatable {
  final double progress;
  final String version;
  final String serialNumber;
  final ViewStatus viewStatus;
  final String errorMessage;

  const InstallationWizardState({
    this.progress = 0,
    this.version = "1.0.0",
    this.serialNumber = "",
    this.viewStatus = ViewStatus.enabled,
    this.errorMessage = "",
  });

  InstallationWizardState copyWith({
    double? progress,
    String? version,
    String? serialNumber,
    ViewStatus? viewStatus,
    String? errorMessage,
  }) {
    return InstallationWizardState(
      progress: progress ?? this.progress,
      version: version ?? this.version,
      serialNumber: serialNumber ?? this.serialNumber,
      viewStatus: viewStatus ?? this.viewStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
    progress,
    version,
    serialNumber,
    viewStatus,
    errorMessage,
  ];
}
